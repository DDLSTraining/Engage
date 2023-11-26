# Selecting and Sorting

```PowerShell
# To Select several properties from each object use the following command
Get-Service | Select-Object -Property Status, StartType, Name

# To show all of the properties that the objects contain do the following:
Get-Service | Select-Object -Property *

# To sort the process objects by ID:
Get-Process | Sort-object -Property ID 
```

[Back to Topics](../README.md#morning-session)

