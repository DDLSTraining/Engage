<#
.SYNOPSIS
  Lists available virtual machine sizes and locations for your subscription in Azure.
.DESCRIPTION
  The Azure platform sometimes restricts which virtual machine stock code units, or
  sizes of machines, are available for different subscriptions.

  This script lists all the available virtual machine sizes (SKUs) that are
  available for your subscription in each location.
.EXAMPLE
  The following example lists all available virtual machine SKU and locations.
  Get-AvailableSku
.EXAMPLE
  This example will list only the SKUs for location 'australiaeast'.
  Get-AvailableSku -location australiaeast
.EXAMPLE
  This example will list only the locations for SKU 'Standard_D1'.
  Get-AvailableSku -SKU Standard_D1
.EXAMPLE
  This example groups the output by location showing the count of
  available SKUs in each location.
  Get-AvailableSku -GroupByLocation
.EXAMPLE
  This example groups the output by available SKUs showing the count of
  the locations.
  Get-AvailableSku -GroupByLocation
.PARAMETER Location
  Filters the output to just the required location.
.PARAMETER Sku
  Filters the output to just the required stock code unit or size.
.PARAMETER GroupByLocation
  Aggregates the locations showing the count of available SKUs.
.PARAMETER GroupBySku
  Aggregates the available SKUs showing the count by location.
#>

[CmdletBinding(DefaultParameterSetName='Location')]
[OutputType([Array])]
Param (
  [Parameter(Mandatory=$False, ParameterSetName = 'Location')]
  [String]
  $Location = 'All',

  [Parameter(Mandatory=$False, ParameterSetName = 'Sku')]
  [String]
  $Sku,

  [Parameter(Mandatory=$False, ParameterSetName = 'GroupByLocation')]
  [Switch]
  $GroupByLocation,

  [Parameter(Mandatory=$False, ParameterSetName = 'GroupBySku')]
  [Switch]
  $GroupBySku
)


$allSku = Get-AzComputeResourceSku
$vmSku = $allSku | Where-Object {
  $_.ResourceType -eq "virtualMachines" -and $_.Restrictions.length -lt 1
} | Sort-Object -Property Locations

if ($Location -ne 'All') {
  $vmSku = $vmSku | Where-Object { [String]$_.Locations -eq $Location } | `
    Sort-Object -Property Name
} elseif ($Sku) {
  $vmSku = $vmSku | Where-Object { $_.Name -eq $Sku }
}

$result = $vmSku | Foreach-Object {
  [PSCustomObject]@{ Location=[String]$_.Locations; SKU=$_.Name }
}

if ($GroupByLocation) {
  $result = $result | Group-Object -Property Location | `
    Select-Object -Property Count,Name | Sort-Object -Property Count
} elseif ($GroupBySku) {
  $result = $result | Group-Object -Property SKU | `
    Select-Object -Property Count,Name | Sort-Object -Property Count
}

Return $result
