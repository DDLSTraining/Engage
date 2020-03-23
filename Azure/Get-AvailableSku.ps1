$allSku = Get-AzComputeResourceSku
$noRestrictionsSku = $allSku | Where-Object { $_.ResourceType -eq "virtualMachines" -and $_.Restrictions.length -lt 1 }
$availableSkuSummary = $noRestrictionsSku | Select-Object -Property Locations,Name
Return $availableSkuSummary
