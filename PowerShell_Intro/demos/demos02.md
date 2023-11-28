# Understand the command syntax in Windows PowerShell

## Basic Demo

```PowerShell
# PowerShell commands are made up of a Verb and a Noun with a hyphen between them
# The nouns are always singular (never plural)

Get-Date

Get-Service

Get-Help -Name Restart-Service -ShowWindow

Restart-Service -Name Spooler

# Using help to learn about PowerShell concepts

Get-Help -Name About*

Get-Help -Name About_Objects

# Tab completion of commands
# (At the end of each line, hit the TAB key to complete these commands)

Get-Serv

Get-ChildItem -Dire

Get-EventLog -Logname Sec

```

## Intermediate Demo

```PowerShell
# PowerShell Commands can also have a prefix added to the noun 

Get-NetFirewallRule

Get-NetIPAddress

Get-ADUser -filter *

```

## Advanced Demo

```PowerShell
# To Discover which verbs are used and known by PowerShell

Get-Verb

# Parameters can be required

Get-Item

Get-Item -Path C:\Windows 

# Parameters can be optional

Get-Process

Get-Process -Name PowerShell

```


[Back to Topics](../README.md#morning-session)


