<# 
    .SYNOPSIS
    Returns a specific software package or a list of all installed
    software on the operating system.
    
    .DESCRIPTION
    A PSCustomObject collection is returned with the details of the
    software package or packages.
    
    .PARAMETER Name
    Specifies the software package to get information about.
    Wildcards are supported. If the package is not found
    $null will be returned.
#>
[CmdletBinding()]
param
(
    [parameter(Mandatory = $false)]
    [String[]]
    $Name
)

$software = Get-CimInstance -ClassName Win32_Product | Select-Object -Property Name, Version, Vendor, InstallDate, InstallLocation

if ($Name) {
    foreach ($n in $Name) {
        $software = $software | Where-Object Name -match $n
    }
}

Write-Output -InputObject $software
