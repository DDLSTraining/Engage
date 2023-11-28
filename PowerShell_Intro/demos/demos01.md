# Getting To Know PowerShell

## Basic Demo

```PowerShell
# To determine the version of PowerShell that you are using view the contents of this system variable

$PSVersionTable

# Determine what execution policy is set in your environment

Get-ExecutionPolicy
```

## Intermediate Demo

```PowerShell
# To change the execution policy to a more restrictive policy 
Set-ExecutionPolicy -ExecutionPolicy AllSigned
```

## Advanced Demo

```PowerShell
# Installing VSCode will assist in creating PowerShell 7 scripts
# Searching on the internet will discover the installer for VSCode (Visual Studio Code)

Start-Process 'https://www.google.com.au/search?q=vscode download site:code.visualstudio.com'
```


[Back to Topics](../README.md#morning-session)
