# Workstation Machine Setup

Suggested software packages to install on an Azure administrator workstation:

* [Visual Studio Code](https://code.visualstudio.com/)
* [Visual Studio Community Edition](https://visualstudio.microsoft.com/vs/community/)
* [Azure Storage Explorer](https://azure.microsoft.com/en-au/features/storage-explorer/)
* [Azure Az PowerShell Module](https://www.powershellgallery.com/packages/Az) - `Install-Module -Name Az -AllowClobber -Force`
* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows)
* [Git](https://git-scm.com/)
* [Clone the GitHub Azure Quickstart Templates](https://github.com/Azure/azure-quickstart-templates) - `git clone <http address>`

For Database management:

* [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download)
* [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)

## Install with scoop

The following eases the installation and setup of an Azure workstation using the [scoop](https://scoop.sh/) installation package.

First, open PowerShell as Administrator and install `scoop`:

```powershell
iwr -useb get.scoop.sh | iex
```

Add the extras bucket:

```powershell
scoop bucket add extras
```

Now install required applications:

```powershell
scoop install dotnet-sdk azure-cli azure-ps azure-functions-core-tools vscode docker docker-compose sed grep nmap jq openssh git vim wget kubectl helm terraform
```

Other optional applications:

```powershell
scoop install packer puppet scriptcs marktext telnet unzip 7zip
```

Checkout the other software available via the [known buckets](https://github.com/lukesampson/scoop#known-application-buckets):

```powershell
scoop bucket known
```

Lastly, update all scoop installed applications:

```powershell
scoop update *
```
