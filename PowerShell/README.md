# <img src="/_images/PowerShell_Core_6.0_icon.png" width="60"></img> Microsoft PowerShell Resources

* [Skillpipe Online Courseware](https://www.skillpipe.com/)
* [PowerShell Core on GitHub](https://github.com/PowerShell/PowerShell)
* [.NET Core on GitHub](https://github.com/dotnet/core)
* [.NET API Browser](https://docs.microsoft.com/en-us/dotnet/api/?view=netcore-3.1)
* [PowerShell Gallery](https://www.powershellgallery.com/)
* [Download Companion Content for Microsoft Official Courseware (MOC)](https://www.microsoft.com/en-us/learning/companion-moc.aspx)
* [Windows PowerShell Language Specification Version 3.0](https://www.microsoft.com/en-au/download/details.aspx?id=36389)
* [Microsoft Terminal](https://github.com/microsoft/terminal)

## Resources

* [PowerShell Community](https://devblogs.microsoft.com/powershell-community/)
* [PowerShell Team Blog](https://devblogs.microsoft.com/powershell/)
* RegEx:
  * [Regular Expression Language - Quick Reference](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
  * [regex101](https://regex101.com/) - Online regular expression calculator
* [Awesome PowerShell](https://github.com/janikvonrotz/awesome-powershell): A curated list of delightful PowerShell packages and resources.
* [Australian Signals Directorate: Securing PowerShell in the Enterprise](https://www.cyber.gov.au/acsc/view-all-content/publications/securing-powershell-enterprise)
* [VS Code](https://code.visualstudio.com/)
* Package Management:
  * [winget](https://docs.microsoft.com/en-us/windows/package-manager/winget/) - Use the winget tool to install and manage applications
  * [Chocolatey](https://chocolatey.org/) - The Package Manager for Windows
  * [Scoop](https://scoop.sh/) - A command-line installer for Windows
* [Squiggle API - for playing with Web APIs](https://api.squiggle.com.au/)
* [Star Wars API](https://swapi.dev/)
* [365 Admin](https://www.365admin.com.au/2017/07/all-my-powershell-technet-downloads.html): Scripts by Terry Munro
* [PS scripts from Brent Denny](https://github.com/brentd09)
* [Neovim](https://neovim.io/) - Hyperextensible Vim-based text editor

## Important Basics

* `Get-Alias`: Alias gal
* `Get-Help`: Alias help, man
* `Get-Help about_*`
* `Get-Command`: Alias gcm
* `Get-Module` and `Get-Module -ListAvailable`: Alias gmo
* `Test-ComputerSecureChannel -Repair`
* `Get-Member`: Alias gm
* Variables `$Number = 55`
* Type Conversion `[string]123`
* Here String: `@" multi-line text "@`
* `Format-List -Property *`: Alias fl *
* `Sort-Object`: Alias sort
* `Measure-Object`: Alias measure
* `Select-Object -ExpandProperty <property name>`: Alias select
* `Where-Object -FilterScript { $_.Property -eq $value }`: Alias where, ?
* `Foreach-Object -Process { $_.MethodName() }`: Alias foreach, %
* `Export-Csv` and `Import-Csv`: Alias epcsv, ipcsv
* `ConvertTo-Json` and `ConvertFrom-Json`
* `ConvertTo-Html`
* `Get-Content`: Alias gc, cat, type
* `Set-Content`
* `Add-Content`: Alias ac
* `Clear-Content`: Alias clc
* `Start-Sleep`: Alias sleep
* `$Error[0]`
* Remoting:
  * `Enter-PSSession`: Alias etsn
  * `Invoke-Command`: Alias icm
* `Set-Clipboard`: Alias scb

## Advanced Tips

* `Group-Object`: Alias group
* `Compare-Object`: Alias compare, diff
* `(Get-Date).ToString("yyyy-MM-dd hh:ss:mm:ms")`: [Custom date and time format strings](https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings)
* Advanced Collections:
  * `$items = New-Object System.Collections.ArrayList` - ArrayList
  * `$items = New-Object System.Collections.Generic.List[<type>]` - Generic List
* `Test-Path`, `Join-Path`, `Split-Path`
* `[CmdletBinding()] Param ( [Parameter(Mandatory=$true)][string]$ParamName )`
* `[PSCustomObject]@{ Property1=Value1; Property2=Value2; }`
* `[PSCustomObject][Ordered]@{ Property1=Value1; Property2=Value2; }`
* `Write-Output` - Defines the script or function output
* `Write-Host`, `Write-Information`, `Write-Warning`, `Write-Verbose`, `Write-Debug`, `Write-Error`
* `Write-Progress`
* `try {} catch {} finally {}`
* `. FunctionOrScriptName` - Dot sourcing
* Background Jobs:
  * `Start-Job`: Alias sajb
  * `Get-Job`: Alias gjb
  * `Receive-Job`: Alias rcjb
  * `Wait-Job`: Alias wjb
  * `Stop-Job`: Alias spjb
  * `Remove-Job`: Alias rjb
* `Start-Transcript -Path log.txt`
* `$MyInvocation.MyCommand.Path` - Inside a script prints the full file path

## Git

* [Git - distributed version control system](https://git-scm.com/)
* Online Git Repository Management:
  * [GitHub](https://github.com/)
  * [GitLab](https://about.gitlab.com/)
  * [Bitbucket](https://bitbucket.org/)

![Git Cheat Sheet](/_images/git.jpeg)

