# Manage Office 365 with PowerShell

* [Introducing the new Azure PowerShell Az module](https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az)
* [AzureAD Module: Azure Active Directory PowerShell for Graph](https://docs.microsoft.com/en-us/powershell/module/azuread/)
* [Connect to Office 365 PowerShell](https://docs.microsoft.com/en-us/office365/enterprise/powershell/connect-to-office-365-powershell)
* [Connect to all Office 365 services in a single Windows PowerShell window](https://docs.microsoft.com/en-us/office365/enterprise/powershell/connect-to-all-office-365-services-in-a-single-windows-powershell-window)
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
