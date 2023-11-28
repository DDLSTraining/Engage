# Understand the Windows PowerShell pipeline

## Basic Demo

```PowerShell

# Find all Notepad instances
# Always check to see if a parameter can provide the input for the command, before using traditional pipelines 

Get-Process -Name Notepad

# Discovering the object attributes created by the Get-Process command

Get-Process | Get-Member

# Formatting the output of a command into a table and then a list

Get-Service -Name Spooler, BITS | Format-Table -Property Status, StartType, Name

Get-Service -Name Spooler, BITS | Format-List -Property Status, StartType, Name
```

## Intermediate Demo

```PowerShell
# This uses the output of the first command as the input to the second command
# (the -WhatIf parameter will not allow the Stop-Process to execute)

Get-ChildItem -Path .\*.tmp | Remove-item -Whatif
```

## Advanced Demo

```PowerShell
# Some commands produce output that does not reflect the actual property names

Get-DnsClientCache

# Using Get-Member to reveal the actual property names in the objects

Get-DnsClientCache | Get-Member

# This passes several words to a command, the command treats the words as input

'Bits', 'Spooler', 'w32Time' | Get-Service
```



[Back to Topics](../README.md#morning-session)

