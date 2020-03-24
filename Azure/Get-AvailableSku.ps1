<#
.SYNOPSIS
    Returns a list of available virtual machine sizes and locations.
.DESCRIPTION
    Filters out virtual machine size SKUs that are not available.
.EXAMPLE
    Get-AvailableSku -location australiaeast
.EXAMPLE
    Get-AvailableSku -GroupByLocation
.PARAMETER Location
    Filters the output to just the required location.
.PARAMETER GroupByLocation
    Aggregates the locations showing the count of available SKUs.
#>

[CmdletBinding()]
[Alias('gas')]
[OutputType([Array])]
Param (
    [Parameter(ParameterSetName = 'Filter')]
    [String]
    $Location,
    
    [Parameter(ParameterSetName = 'GroupByLocation')]
    [Switch]
    $GroupByLocation,

    [Parameter(ParameterSetName = 'GroupBySku')]
    [Switch]
    $GroupBySku
)


$allSku = Get-AzComputeResourceSku
if ($Location) {
    $noRestrictionsSku = $allSku | Where-Object { $_.ResourceType -eq "virtualMachines"`
        -and $_.Restrictions.length -lt 1`
        -and [String]$_.Location -eq $Location }
} else {
    $noRestrictionsSku = $allSku | Where-Object { $_.ResourceType -eq "virtualMachines" -and $_.Restrictions.Length -lt 1 }
}
$availableSkuSummary = $noRestrictionsSku | Foreach-Object { [PSCustomObject]@{ Location=[String]$_.Locations; SKU=$_.Name } }

if ($GroupByLocation) {
    Return $availableSkuSummary | Group-Object -Property Location
} elseif ($GroupBySku) {
    Return $availableSkuSummary | Group-Object -Property SKU
} else {
    Return $availableSkuSummary
}
