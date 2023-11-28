# Getting To Know PowerShell

## Basic Demo

```PowerShell
# To determine the version of PowerShell that you are using view the contents of this system variable

$PSVersionTable

# PowerShell is a command line console, so commands and scripts do not need to be compiled first to run

Get-SmbShare
```

## Intermediate Demo

```PowerShell
# Parameters can change the way that the command runs 
Get-Service

Get-Service -Name BITS
```

## Advanced Demo

```PowerShell


# A script file can also be created to store a series of commands that can be run by calling the name of the script
# The next command will create a script called Get-Shares.ps1

"Get-SmbShare" | Out-File -Filepath .\Get-Shares.ps1

# This command will run the script

.\Get-Shares.ps1
```


[Back to Topics](../README.md#morning-session)
