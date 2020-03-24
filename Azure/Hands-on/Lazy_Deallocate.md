# Automated Shutdown with Azure Resource Manager REST API using PowerShell

## Overview
This script will go through and create an App Registration, create a custom role, assign the role across all scopes to the App Registration, query all VMs in the subscription, filter for VMs in a stopped (not Deallocated) state, check when they were stopped and then deallocate anything that has been stopped for over an hour.


## Prerequisites

To utilise this you will need the following:

* Azure Account with a valid Subscription.
* A Virtual Machine in a Resource Group.
  * This is used as a target for executing actions using the REST API.

## Preparation Steps
**Step 1**: Open PowerShell on your computer. _If you wish to use the [Azure Cloud Shell](https://shell.azure.com/), change directory to your home path using `cd ~`._

**Step 2**: Login to the Azure AZ module (skip this step if using Azure Cloud Shell):

```powershell
Connect-AzAccount
```
## Final Notes
This script is not ready for automation yet, you will need to store your App credentials either in a file or associate it with a Managed Identity, then edit the script to reference them instead of requiring you to login.
Everything needed is in the script or in prior modules.
Good Luck

## Script
```powershell
function Decrypt-SecureString {
  param(
    [Parameter(ValueFromPipeline = $true, Mandatory = $true, Position = 0)]
    [System.Security.SecureString]
    $SecureString
  )
  # https://blogs.msdn.microsoft.com/besidethepoint/2010/09/21/decrypt-secure-strings-in-powershell/
  $marshal = [System.Runtime.InteropServices.Marshal]
  $ptr = $marshal::SecureStringToBSTR( $SecureString )
  $str = $marshal::PtrToStringBSTR( $ptr )
  $marshal::ZeroFreeBSTR( $ptr )
  Write-Output -InputObject $str
}

function Show-Variables {
$variables = @"
Resource Group Name: $resourceGroupName
            VM Name: $vmName
           App Name: $appName
          Role Name: $roleName
    Subscription Id: $subscriptionId
          Tenant Id: $tenantId
              Scope: $scope
             Secret: $secret
 Client Id (App Id): $clientId
          Token URI: $tokenUri
              Token: $token
"@
Write-Host -Object $variables
}

$vmName = ''
$appName = 'app-rest-api-exercise'
$roleName = 'Virtual Machine Operator'

$roleJson = @"
{
  "Name": "$roleName",
  "IsCustom": true,
  "Description": "Can deallocate, start  and restart virtual machines.",
  "Actions": [
    "Microsoft.Storage/*/read",
    "Microsoft.Network/*/read",
    "Microsoft.Compute/*/read",
    "Microsoft.Compute/virtualMachines/start/action",
    "Microsoft.Compute/virtualMachines/restart/action",
    "Microsoft.Compute/virtualMachines/deallocate/action",
    "Microsoft.Authorization/*/read",
    "Microsoft.ResourceHealth/availabilityStatuses/read",
    "Microsoft.Resources/subscriptions/resourceGroups/read",
    "Microsoft.Insights/alertRules/*",
    "Microsoft.Insights/diagnosticSettings/*",
    "Microsoft.Support/*"
  ],
  "NotActions": [
  ],
  "AssignableScopes": [
  ]
}
"@
$roleJson=$roleJson|ConvertFrom-Json
$scopes=@()
$subscription = Get-AzSubscription
Get-AzResourceGroup|foreach-object{
$resourceGroupName=$_.ResourceGroupName

$scope = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName"
$scopes+=$scope
$roleJson.AssignableScopes+="$scope"


}

try {New-AzRoleDefinition -Role $roleJson} 
catch {
$roleJson | Add-Member -NotePropertyName ID -NotePropertyValue $(Get-azroledefinition $roleJson.Name).ID
Set-AzRoleDefinition -Role $roleJson}

$app = New-AzADServicePrincipal -DisplayName $appName -Role $roleName
$secret = Decrypt-SecureString -SecureString $app.Secret
$clientId = $app.ApplicationId.Guid



$tokenUri = "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token"
$tokenHeaders = @{
  'Content-Type' = 'application/x-www-form-urlencoded'
}
$tokenBody = @{
  grant_type    = 'client_credentials'
  client_id     = $clientId
  client_secret = $secret
  scope         = 'https://management.azure.com/.default'
}
$token = Invoke-RestMethod -Method POST -Uri $tokenUri -Headers $tokenHeaders -Body $tokenBody
$actionHeaders = @{
  Authorization = 'Bearer ' + $token.access_token
}
$scopes|foreach-object{New-AzRoleAssignment -Scope $_ -RoleDefinitionName $roleName -ApplicationId $clientID}



$VMs=Get-AzVM -status|?{$_.PowerState -eq "VM stopped"}

$vms|foreach-object{
$URI="https://management.azure.com"+$_.ID+"/providers/Microsoft.ResourceHealth/availabilityStatuses/current?api-version=2018-07-01-preview"
$response=Invoke-RestMethod -Uri $URI -Method GET -Headers $actionHeaders
if($response.properties.title -eq "Stopped by user or process" -and [datetime]$response.properties.occuredTime -lt $(Get-Date).AddHours(-1)){

$deallocateUri = "https://management.azure.com"+$_.ID+"/deallocate?api-version=2018-06-01"
$actionHeaders = @{
  Authorization = 'Bearer ' + $token.access_token
}
Invoke-RestMethod -Method POST -Uri $deallocateUri -Headers $actionHeaders -Verbose
}
}
###
#Get-AzRoleAssignment -RoleDefinitionName $roleName | Remove-AzRoleAssignment -
#Get-AzRoleDefinition -Name $roleName | Remove-AzRoleDefinition -Force
#Get-AzADApplication -DisplayName $appName | Remove-AzADApplication -Force
```