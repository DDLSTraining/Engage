# Selecting and Sorting

```PowerShell
# To Select several properties from each object use the following command
Get-Service | Select-Object -Property Status, StartType, Name

# To show all of the properties that the objects contain do the following:
Get-Service | Select-Object -Property *

# To sort the process objects by ID:
Get-Process | Sort-object -Property ID 

# A more advanced pipeline will filter by two properties
Get-ADUser -Filter * -Properties Department |
  Sort-Object Department, Name |
  Select-Object -Property Department, Name
```

[Back to Topics](../README.md#morning-session)

