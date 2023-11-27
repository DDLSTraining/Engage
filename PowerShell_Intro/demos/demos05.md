# Understand the Windows PowerShell pipeline

```PowerShell
# This passes several words to a command, the command treats the words as input
'Bits', 'Spooler', 'w32Time' | Get-Service

# More advanced pipelines use the output of the first command for the input of the second command
Get-ChildItem -Path .\*.tmp | Remove-item -Confirm 
```

[Back to Topics](../README.md#morning-session)

