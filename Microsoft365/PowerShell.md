# Manage Office 365 with PowerShell

## SharePoint Module

* [Getting started with SharePoint Online Management Shell](https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-online/connect-sharepoint-online?view=sharepoint-ps)

## Install the AzureAD PowerShell module for PowerShell Core

* Source: https://blogs.endjin.com/2019/05/how-to-use-the-azuread-module-in-powershell-core/
* Gallery: https://www.poshtestgallery.com/

```PowerShell
Register-PackageSource -Trusted -ProviderName 'PowerShellGet' -Name 'Posh Test Gallery' -Location 'https://www.poshtestgallery.com/api/v2/'
Install-Module -Name 'AzureAD.Standard.Preview' -Force
$module = Get-Module 'AzureAD.Standard.Preview' -ListAvailable
Import-Module $module.RootModule
```
