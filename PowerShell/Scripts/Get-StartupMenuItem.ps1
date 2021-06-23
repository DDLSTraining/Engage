<# 
    .SYNOPSIS
    Returns the full path of any items in the startup folder.
    Supply the Name parameter to filter the result.
    
    Author: Grant Carthew.
    Date: Feb 2011
    
    .DESCRIPTION
    If the startup menu item does not exist it will return a $null.

    .PARAMETER Name
    The name or part there of for the shortcut in the all users startup folder.
    If no name is passed the all startup items will be returned.
#>

param
(
    [parameter(Mandatory = $false)]
    [String]
    $Name
)

$AllUsersStartupPath = Join-Path -Path (Get-Content -Path Env:\ALLUSERSPROFILE) -ChildPath "\Microsoft\Windows\Start Menu\Programs\Startup"
$results = Get-ChildItem -Path $AllUsersStartupPath -Filter "*$Name*"

Write-Output -InputObject $results