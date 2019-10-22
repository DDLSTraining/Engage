# Manage Office 365 with PowerShell

## SharePoint Module

* [Getting started with SharePoint Online Management Shell](https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-online/connect-sharepoint-online?view=sharepoint-ps)

## Install the AzureAD PowerShell module for PowerShell Core

* [PowerShell Core](https://github.com/PowerShell/PowerShell) - Maybe use [scoop](/Internet/Scoop.md)!
* [How to use the AzureAD module in PowerShell Core](https://blogs.endjin.com/2019/05/how-to-use-the-azuread-module-in-powershell-core/)
* [Test PowerShell Gallery](https://www.poshtestgallery.com/)

```PowerShell
Register-PackageSource -Trusted -ProviderName 'PowerShellGet' -Name 'Posh Test Gallery' -Location 'https://www.poshtestgallery.com/api/v2/'
Install-Module -Name 'AzureAD.Standard.Preview' -Force
$module = Get-Module 'AzureAD.Standard.Preview' -ListAvailable
Import-Module $module.RootModule
```
