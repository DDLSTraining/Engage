# Understand the Windows PowerShell pipeline

## Basic Demo

```PowerShell

# Find all Notepad instances
# Always check to see if a parameter can provide the input for the command, before using traditional pipelines 

Get-Process -Name Notepad

# Discovering the object attributes from the Get-Process command
Get-Process | Get-Member
```

## Intermediate Demo

```PowerShell
# This uses the output of the first command as the input to the second command
# (the -WhatIf parameter will not allow the Stop-Process to execute)

Get-ChildItem -Path .\*.tmp | Remove-item -Whatif

```

## Advanced Demo

```PowerShell

# This passes several words to a command, the command treats the words as input
'Bits', 'Spooler', 'w32Time' | Get-Service


```



[Back to Topics](../README.md#morning-session)

