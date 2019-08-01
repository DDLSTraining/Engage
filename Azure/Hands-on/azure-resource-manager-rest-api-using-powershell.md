# Azure Resource Manager REST API using PowerShell

This exercise will demonstrate how to call the Azure REST APIs by generating an OAuth access token and calling the Azure management virtual machine endpoint.

Specifically the authentication process used is called [OAuth 2.0 client credentials flow](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-client-creds-grant-flow).

It is written for PowerShell Core, however the Azure CLI could be used. You will need to lookup the Bash and CLI commands to use the Azure CLI.

## Overview

These are the high level phases of the exercise:

* Create variables required for completing the exercise.
* Create an RBAC Custom Role.
* Create an Azure AD App Registration with Service Principle
* Generate an OAuth 2.0 access token.
* Deallocate a virtual machine using the access token.

The following resources will be created in Azure:

* A custom Role scoped on a Resource Group giving permissions to Start, Stop, and Deallocate Virtual Machines.
* An Azure AD Application Registration with a Service Principle used as the management account.

## Prerequisites

To complete the following exercise you will need the following:

* Azure Account with a valid Subscription.
* A Virtual Machine in a Resource Group.
  * This is used as a target for executing actions using the REST API.
* If not using Cloud Shell, install:
  * [PowerShell Core](https://github.com/PowerShell/PowerShell/releases)
  * The `AZ` [PowerShell module](https://www.powershellgallery.com/packages?q=az).

## Exercise Steps

**Step 1**: Open PowerShell on your computer.

**Step 2**: Login to the Azure AZ module:

```powershell
Connect-AzAccount
```

**Step 3**: Copy and paste the following code to create helper functions:

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
```

_Tip: Always press `Enter` after pasting text into PowerShell to ensure the complete block of script has been entered._

**Step 4**: Set the following variables in PowerShell. You will need to get the Resource Group name and the Virtual Machine name from Azure. Feel free to change the `appName` and `roleName` variables. Copy and paste the whole block and then use the up arrow to change the values:

```powershell
$resourceGroupName = ''
$vmName = ''
$appName = 'app-rest-api-exercise'
$roleName = 'Virtual Machine Operator'
```

**Step 5**: Get your subscription details:

```powershell
# If you only have one subscription
$subscription = Get-AzSubscription
# If you have more than one subscription
$subscription = Get-AzSubscription -SubscriptionName 'your subscription name'
$subscriptionId = $subscription.Id
$tenantId = $subscription.TenantId
```

**Step 6**: Define the scope of Azure management:

```powershell
$scope = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName"
```

**Step 7**: Review the variables you have set:

```powershell
Show-Variables
```

**Step 8**: Create a custom administration role in Azure:

```powershell
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
    "$scope"
  ]
}
"@
Out-File -FilePath ".\$roleName.json" -InputObject $roleJson
New-AzRoleDefinition -InputFile ".\$roleName.json"
```

**Step 9**: Create a new Azure AD App Registration with a Service Principle. This will also assign the custom role to the Service Principle and set the management scope:

```powershell
$app = New-AzADServicePrincipal -DisplayName $appName -Scope $scope -Role $roleName
$secret = Decrypt-SecureString -SecureString $app.Secret
$clientId = $app.ApplicationId.Guid
```

**Step 10**: You can try the following step immediately after creating the Service Principle, however it may not work right away. If it fails, wait a few moments and try again. Now get an access token used to authenticate against the Azure Management REST API:

```powershell
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
```

**Step 11**: Review the variables you have set again:

```powershell
Show-Variables
```

**Step 12**: Finally, execute the `deallocate` action against the virtual machine:

```powershell
$deallocateUri = "https://management.azure.com/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroupName/providers/Microsoft.Compute/virtualMachines/$VMName/deallocate?api-version=2018-06-01"
$actionHeaders = @{
  Authorization = 'Bearer ' + $token.access_token
}
Invoke-RestMethod -Method POST -Uri $deallocateUri -Headers $actionHeaders -Verbose
```

## Optional

If you wish to inspect the JSON Web Token generated, paste the token string into the [jwt.ms](http://jwt.ms/) page. Access the token string using `$token.access_token`.

## Clean Up

Execute the following commands to remove the resources:

```powershell
Get-AzRoleAssignment -RoleDefinitionName $roleName | Remove-AzRoleAssignment
Get-AzRoleDefinition -Name $roleName | Remove-AzRoleDefinition
Get-AzADApplication -DisplayName $appName | Remove-AzADApplication
```

## Review

In the above exercise you have created an OAuth 2.0 access token that can be used against the Azure Management API. Take a look at the `scope` value in **Step 10**.

Other Virtual Machine actions are available. See the [Microsoft documentation](https://docs.microsoft.com/en-us/rest/api/compute/virtualmachines).

The access token generated can be used with any HTTP client that supports sending a POST request to the Management API endpoints. You will need to adjust the Role and Scope to work outside of the defined Resource Group.


