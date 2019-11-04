# Scoop

* [Scoop Homepage](https://scoop.sh/) - A command-line installer for Windows.
* [Scoop Docs](https://scoop-docs.now.sh/) - Unofficial documentation.
* [Scoop Apps](https://scoop-docs.now.sh/apps/) - Search for apps in multiple buckets.
* [Scoop Awesome](https://github.com/ScoopInstaller/Awesome) - A curated list of awesome Scoop resources and more.

## Installation

Open PowerShell as Administrator and run the following command to install `scoop`:

```powershell
iwr -useb get.scoop.sh | iex
```

Restart PowerShell and add known [buckets](https://github.com/lukesampson/scoop#known-application-buckets):

```powershell
scoop bucket add <bucket name>
```

Suggested buckets to install the packages below are `extras`. The `versions` bucket can be handy to install beta packages such as PowerShell `pwsh-beta`.

## Scoop Packages for your Workstation

Checkout the [buckets](https://github.com/lukesampson/scoop#known-application-buckets) for a full list, however here are some packages you might find interesting for your Workstation.

For any of the packages below, simply type `scoop install <package name>` from a PowerShell prompt. To install multiple packages at once, put a space after each package name.

### Generic Packages

* `7zip` - A multi-format file archiver with high compression ratios.
* `copyq` - Clipboard manager.
* `coreutils` - A collection of GNU utilities such as bash, make, gawk and grep.
* `dig` - dig (domain information groper) is a flexible tool for interrogating DNS name servers.
* `filezilla-server` - Open-source FTP server software.
* `filezilla` - Fast and reliable cross-platform FTP, FTPS and SFTP client.
* `firefox` - Popular open source web browser.
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

