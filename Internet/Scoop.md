# Scoop

* [scoop](https://scoop.sh/) - A command-line installer for Windows.

## Installation

Open PowerShell as Administrator and run the following command to install `scoop`:

```powershell
iwr -useb get.scoop.sh | iex
```

Add known [buckets](https://github.com/lukesampson/scoop#known-application-buckets):

```powershell
scoop bucket add <bucket name>
```

Suggested buckets to install the packages below are `extras`

## Scoop Packages for your Workstation

Checkout the [buckets](https://github.com/lukesampson/scoop#known-application-buckets) for a full list, however here are some packages you might find interesting for your Workstation.

For any of the packages below, simply type `scoop install <package name>` from a PowerShell prompt.

### Generic Packages

* `7zip` - A multi-format file archiver with high compression ratios.
* `copyq` - Clipboard manager.
* `filezilla-server` - Open-source FTP server software.
* `filezilla` - Fast and reliable cross-platform FTP, FTPS and SFTP client.
* `grep` - Print lines matching a pattern.
* `marktext` - A simple and elegant markdown editor.
* `nmap` - Network exploration and security auditing utility.
* `notepadplusplus` - Notepad replacement that supports several languages.
* `openssh` - A suite of secure networking utilities based on the Secure Shell protocol.
* `sed` - Stream editor.
* `telnet` - Telnet client.
* `unzip` - Unzip compression utility.
* `vim` - A highly configurable text editor for efficiently creating and changing any kind of text.
* `vscode` - Visual Studio Code is a lightweight but powerful text editor.
* `wget` - A command-line utility for retrieving files using HTTP, HTTPS, FTP, and FTPS protocols.
* `wireshark` - A network protocol analyzer.

### Development Packages

* `deno` - A secure JavaScript/TypeScript runtime on V8.
* `docker` - Open platform for developing, shipping, and running applications.
* `docker-compose` - Define and run multi-container applications with Docker.
* `git` - Distributed version control system.
* `helm` - The package manager for Kubernetes.
* `helmfile` - Command line interface to deploy Kubernetes Helm Charts.
* `jq` - Lightweight and flexible command-line JSON processor.
* `kubectl` - Control the Kubernetes cluster manager.
* `nodejs` - Asynchronous event driven JavaScript runtime.
* `packer` - Automates the creation of any type of virtual machine image.
* `scriptcs` - Scriptcs makes it easy to write and execute C# with a simple text editor.
* `terraform` - Create and manage infrastructure as code using simple declarative configuration files.
* `vagrant` - A tool for building and managing virtual machine environments in a single workflow.

### Azure Packages

* `azure-cli` - Microsoft Azure CLI 2.0.
* `azure-functions-core-tools` - Microsoft Azure Functions Core Tools.
* `azure-ps` - PowerShell cmdlets for Microsoft Azure.
* `storageexplorer` - Easily manage the contents of your Azure storage account.

