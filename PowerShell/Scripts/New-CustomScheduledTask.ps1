<#
.SYNOPSIS
	An example script showing how to create a Scheduled Task.
#>
$TaskName = 'Example Task'
$TaskPath = '\DDLS'

$Action = New-ScheduledTaskAction -Execute ping.exe
$Trigger = New-ScheduledTaskTrigger -Daily -At 0am -RandomDelay (New-TimeSpan -Hours 24)
Register-ScheduledTask -TaskName $TaskName -TaskPath $TaskPath -Action $Action -Trigger $Trigger

