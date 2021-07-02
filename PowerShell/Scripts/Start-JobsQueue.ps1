<# 
  .SYNOPSIS
  Starts background jobs using a queue to throttle the number of concurrent jobs.
  
  .DESCRIPTION
  This Queue system creates background PowerShell Jobs to enable queuing
  large numbers of jobs to be processed limiting the number of concurrent
  jobs that are running.

  All the job data is added to the queue on starting the script. The jobs
  get processed with the initial number of concurrent background jobs being 50.
  You can change this number using the MaxConcurrentJobs parameter.

  As a background job finishes it is removed from the queue and a new background
  job is started. This process continues until all of the jobs have been completed.

  The work that gets done by the job is defined by the JobProcess ScriptBlock
  parameter. The job result is handled by the JobResult ScriptBlock parameter.

  The process and management of the PowerShell background jobs is not the
  responsibility of your JobProcess and JobResult ScriptBlocks. This script
  will create and then remove the background jobs.

  .PARAMETER JobData
  JobData should be any value you need to process in the jobs.
  You will receive this data as the first and only parameter of
  your process script.

  .PARAMETER JobProcess
  This is the ScriptBlock that gets passed into the Start-Job
  cmdlet.

  The JobProcess script block has the following requirements:
  - MUST accept one parameter which is a JobData item

  Here is an example of a script block you can pass into JobProcess.
  This example would require the JobData to be IP addresses:

  $ProcessScript = {
    Param ([string]$IPAddress)
    Test-Connection -ComputerName $IPAddress -Count 1
  }

  .PARAMETER JobResult
  This ScriptBlock gets executed within Start-JobsQueue to return
  the job processing result to you.

  The JobResult script block has the following requirements:
  - MUST accept one parameter which is the job results

  Here is an example of a ScriptBlock you can pass into JobResult.

  $ResultScript = {
    Param ([int]$JobResult)
    Write-Output -InputObject "Ping: $($JobResult.Address.IPAddressToString) $($JobResult.Status)"
  }

  As you can see above, you can simply Write-Output the results
  if you want to. Alternatively, you could save the results into
  a file or a database.

  .PARAMETER MaxConcurrentJobs
  Default value: 50

  This value defines the maximum number of concurrent background
  PowerShell Jobs to create.

  Increase the number if your system can handle more jobs.

  .PARAMETER JobPollPeriodInMilliseconds
  Default value: 100

  This delay is used to prevent the job queue loop from processing
  too quickly.

  Increasing this value slows down job queue processing speed and job
  reporting delay whilst reducing CPU usage.

  Decreasing this value increases job queue processing speed whilst
  increasing CPU usage.

  .EXAMPLE
  This simple example pings a few DNS servers.

  $ProcessScript = {
    Param ([string]$IPAddress)
    Test-Connection -ComputerName $IPAddress -Count 1
  }

  $ResultScript = {
    Param ($JobResult)
    Write-Output -InputObject "Ping: $($JobResult.Address.IPAddressToString) $($JobResult.Status)"
  }

  Start-JobsQueue -JobProcess $ProcessScript -JobResult $ResultScript -JobData "1.1.1.1","8.8.8.8","8.8.4.4"
#>
[CmdletBinding()]
Param (
  [Parameter(Mandatory=$true)]
  [PSObject[]]
  $JobData = @(),

  [Parameter(Mandatory=$true)]
  [scriptblock]
  $JobProcess,

  [Parameter(Mandatory=$true)]
  [scriptblock]
  $JobResult,

  [Parameter(Mandatory=$false)]
  [int]
  $MaxConcurrentJobs = 50,

  [Parameter(Mandatory=$false)]
  [double]
  $JobPollPeriodInMilliseconds = 100 
)

$Queue = [System.Collections.Queue]::Synchronized( (New-Object System.Collections.Queue) )
foreach ($JobValue in $JobData) { $Queue.Enqueue($JobValue) }
Write-Verbose -Message "Total jobs queued: $($Queue.Count)"

$Jobs = New-Object System.Collections.ArrayList

while ($Queue.Count -gt 0 -or $Jobs.Count -gt 0)
{
  # If we have open job spots kick off some more.
  if ($Jobs.Count -le $MaxConcurrentJobs) {
    # Determine how many to kick off.
    $NumberOfJobsToAdd = ($MaxConcurrentJobs - $Jobs.Count)
    Write-Verbose -Message "Adding $($NumberOfJobsToAdd) job(s) to the job queue"

    while ($NumberOfJobsToAdd -gt 0 -and $Queue.Count -gt 0) {
      # Start the background job to process the users ScriptBlock
      $NewJob = Start-Job -ScriptBlock $JobProcess -ArgumentList $Queue.Dequeue()
      [VOID]$Jobs.Add($NewJob.Id)
      Write-Verbose -Message "Background job started with Id: $($NewJob.Id)"
      $NumberOfJobsToAdd--
    }
  }
  
  $CompletedJobsToRemove = @()
  
  foreach ($JobId in $Jobs) {
    $JobDetail = Get-Job -Id $JobId
    if ($JobDetail.JobStateInfo.state -eq 'Completed') {
      Write-Verbose -Message "Job $JobId completed. Executing JobResult script"
      # Execute the user JobResult ScriptBlock
      &$JobResult (Receive-Job -Id $JobId)
      Remove-Job -Id $JobId
      $CompletedJobsToRemove += $JobId
    }
  }
  
  Write-Verbose -Message "Removing $($CompletedJobsToRemove.length) completed jobs"
  foreach ($JobToRemove in $CompletedJobsToRemove) { $Jobs.Remove($JobToRemove) }

  # The below delay prevents the while loop from looping too quickly
  # causing high CPU usage. High values will slow down job reporting.
  Write-Verbose -Message "Sleeping for $JobPollPeriodInMilliseconds ms"
  Start-Sleep -Milliseconds $JobPollPeriodInMilliseconds
}

Write-Verbose -Message "All job processing completed"