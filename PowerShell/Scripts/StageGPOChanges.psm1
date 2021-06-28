function New-StagedGPO {
  #Requires -modules GroupPolicy, ActiveDirectory
  <#
  .SYNOPSIS
    Creates a staging GPO for change control
  .DESCRIPTION
    This command will help you stage settings for a GPO so that you can test those settings before making
    changes to the general production environment.
    From the command line you will specify a GPO that you wish to edit, an OU that you wish the test to be
    conducted from and a AD security group to which the "test GPO" will be security filtered. The "test GPO" is 
    automatically created by this command and linked to the OU your specify and will be security filtered 
    to the group mentioned earlier.
    If the GPO you specified is linked to the OU you specified, then the "test GPO" will be linked to that OU 
    and will be given a higher priority than the original GPO you specified. 
    If the GPO is not linked to the OU you specified then the "test GPO" will be linked to the OU and the 
    GPO priority will be set to the highest on that OU.
    This gives you the oppotunity to have the "test GPO" linked to either the original OU or to a test OU.
    After this is done you can then edit the "test GPO" and audit the results as those that were in the 
    security group login and experience the new GPO settings you are considering.
    The name of the "test GPO" will be as follows 
    for example: If the specified GPO was SalesGPO then the "test GPO" name will be "SalesGPO_Staged_ForTesting"
  .EXAMPLE
    New-StagedGPO -GPOName ITGpo -OUDistinguishedName 'ou=IT,dc=adatum,dc=com' -TestingGroup GPOTesters
    This will create a new GPO called ITGpo_Staged_ForTesting and link it to the IT OU specified, it will then change the 
    security filtering on the link so that only the GPOTesters group will be targeted by the GPO and the 
    priority of this new GPO will be set to be either a higher prority than the original GPO if in the same OU or the 
    highest priority if it has been linked to a special testOU.
  .PARAMETER OUDistinguishedName
    This paramter tells the command which OU you wish to have the staging GPO linked to. This parameter is dynamic
    intellisense can be used to choose the OU from the commandline.
  .PARAMETER GPOName
    This is the GPO that will be copied and security filtered and then linked to the GPO so that the 
    staged testing of any new chages can take place. This parameter is dynamic
  .PARAMETER TestingGroup
    This is the group that the staging GPO will be security filtered to. This parameter is dynamic.
  .NOTES
    General notes
      Created By: Brent Denny
      Created On: 30-May-2019
  #>

  [CmdletBinding()]
  Param ()
  DynamicParam { 
    $ADModule = Get-Module -ListAvailable | Where-Object {$_.Name -in @('ActiveDirectory','GroupPolicy')}
    if ($ADModule.Count -lt 2) {
      Write-Warning "You need to run this on a machine that has access to the ActiveDirectory and GroupPolicy modules"
      break
    }
    $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary

    $ParamName_OU = 'OUDistinguishedName'
    $AttributeCollection_OU = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
    $ParameterAttribute_OU = New-Object System.Management.Automation.ParameterAttribute
    $ParameterAttribute_OU.Mandatory = $true
    $ParameterAttribute_OU.Position = 1
    $AttributeCollection_OU.Add($ParameterAttribute_OU) 
    $ArraySet_OU = (Get-ADOrganizationalUnit -Filter *).distinguishedname
    $ValidateSetAttribute_OU = New-Object System.Management.Automation.ValidateSetAttribute_OU($ArraySet_OU)    
    $AttributeCollection_OU.Add($ValidateSetAttribute_OU)
    $RuntimeParameter_OU = New-Object System.Management.Automation.RuntimeDefinedParameter($ParamName_OU, [string], $AttributeCollection_OU)
    
    $ParamName_GPO = 'GPOName'
    $AttributeCollection_GPO = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
    $ParameterAttribute_GPO = New-Object System.Management.Automation.ParameterAttribute
    $ParameterAttribute_GPO.Mandatory = $true
    $ParameterAttribute_GPO.Position = 2
    $AttributeCollection_GPO.Add($ParameterAttribute_GPO)  
    $ArraySet_GPO = (Get-GPO -all).DisplayName
    $ValidateSetAttribute_GPO = New-Object System.Management.Automation.ValidateSetAttribute($ArraySet_GPO)
    $AttributeCollection_GPO.Add($ValidateSetAttribute_GPO)
    $RuntimeParameter_GPO = New-Object System.Management.Automation.RuntimeDefinedParameter($ParamName_GPO, [string], $AttributeCollection)
    
    $ParamName_Group = 'TestingGroup'
    $AttributeCollection_Group = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
    $ParameterAttribute_Group = New-Object System.Management.Automation.ParameterAttribute
    $ParameterAttribute_Group.Mandatory = $true
    $ParameterAttribute_Group.Position = 3
    $AttributeCollection_Group.Add($ParameterAttribute_Group)  
    $ArraySet_Group = (Get-ADGroup -Filter *).Name
    $ValidateSetAttribute_Group = New-Object System.Management.Automation.ValidateSetAttribute($ArraySet_Group)
    $AttributeCollection_Group.Add($ValidateSetAttribute_Group)
    $RuntimeParameter_Group = New-Object System.Management.Automation.RuntimeDefinedParameter($ParamName_Group, [string], $AttributeCollection_Group)


    $RuntimeParameterDictionary.Add($ParamName_OU, $RuntimeParameter_OU)
    $RuntimeParameterDictionary.Add($ParamName_GPO, $RuntimeParameter_GPO)
    $RuntimeParameterDictionary.Add($ParamName_Group, $RuntimeParameter_Group)
    return $RuntimeParameterDictionary
  } # End - DynamicParams

  
  process {
    #using Dynamic params
    $GPOName             = $PSBoundParameters[$ParamName_GPO]
    $OUDistinguishedName = $PSBoundParameters[$ParamName_OU]
    $TestingGroup        = $PSBoundParameters[$ParamName_Group]
    $GPOStagingName = $GPOName +'_Staged_ForTesting'

    write-verbose "GPO - $GPOName , OU - $OUDistinguishedName , Grp - $TestingGroup , StagedGPO - $GPOStagingName"

    $SelectedGPO = Get-GPO -all | Where-Object {$_.DisplayName -eq $GPOName}
    $SelectedOU  = Get-ADOrganizationalUnit -Identity $OUDistinguishedName -Properties *
    [array]$StagedGPO = Get-GPO -all | Where-Object {$_.DisplayName -eq $GPOStagingName}
    if ($StagedGPO.count -eq 0 ) {
      try {
        Write-Verbose "Attempting to copy the GPO to the testing GPO"
        $SelectedGPO | Copy-GPO -TargetName $GPOStagingName -ErrorAction Stop *> $null
      } # end - try
      catch {
        Write-Warning "Problem creating the staged copy of the GPO. Check if $GPOStagingName already exists in Group Policy"
        break
      } # end - catch
      if ($SelectedOU.GPLink -match $SelectedGPO.Id.Guid) {  # OU chosen has the selected GPO linked
        $GpLinks = $SelectedOU.GPLink
        $RegEx   = '[a-fA-F0-9]{8}\-[a-fA-F0-9]{4}\-[a-fA-F0-9]{4}\-[a-fA-F0-9]{4}\-[a-fA-F0-9]{12}'
        $GpLinkGuids = [regex]::Matches($GpLinks,$RegEx).Value
        [array]::Reverse($GpLinkGuids)
        $TestGpoOrder = ($GpLinkGuids.toUpper().indexOf($SelectedGPO.Id.Guid.toUpper()) + 1)
      } #end - if
      else {  # OU Chosen doen not have the selected GPO linked
        $TestGpoOrder = 1
      } # end - else
      Write-Verbose "TestGpoOrder - $TestGpoOrder , GPLinkGuids - $GpLinkGuids"
      try { 
        Write-Verbose "Attempting to link the new GPO to the OU"
        New-GPLink -Name $GPOStagingName -Target $OUDistinguishedName -ErrorAction stop *> $null
        Write-Verbose "Attempting to set the priority order of the new GPO"
        Set-GPLink -Name $GPOStagingName -Order $TestGpoOrder -Target $OUDistinguishedName -ErrorAction stop *> $null
        Write-Verbose "Attempting to set the security filtering by removing Authenticated Users and adding $TestingGroup"
        Set-GPPermission -Name $GPOStagingName -TargetName $TestingGroup -PermissionLevel 'GpoApply' -TargetType 'Group' -Replace -ErrorAction stop *> $null
        Set-GPPermission -Name $GPOStagingName -TargetName 'Authenticated Users' -PermissionLevel 'None' -TargetType 'Group' -Replace -ErrorAction stop *> $null
      } # end - try
      catch {
        Write-Warning "There was an issue setting up the staged GPO"
      } #end - catch
    } # end - if
    else {
      Write-Warning "There is an existing GPO with the name of $GPOStagingName, you will need to remove this from the Group Policy Objects before running this command again"
    } # end - if-else
  } # end - process block
} # end - function
