$allSku = Get-AzComputeResourceSku
$noRestrictionsSku = $allSku | Where-Object { $_.ResourceType -eq "virtualMachines" -and $_.Restrictions.length -lt 1 }
$availableSkuSummary = $noRestrictionsSku | Foreach-Object { [PSCustomObject]@{ Location=[String]$_.Locations; Name=$_.Name } }
Return $availableSkuSummary
