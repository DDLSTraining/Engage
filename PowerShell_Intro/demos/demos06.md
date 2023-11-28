# Selecting and Sorting

## Basic Demo

```PowerShell

# To Select several properties from each object use the following command
Get-Service | Select-Object -Property Status, StartType, Name

# To sort the process objects by ID:
Get-Process | Sort-object -Property ID 

```

## Intermediate Demo

```PowerShell

# A more advanced pipeline will filter by two properties
Get-ADUser -Filter * -Properties Department |
  Sort-Object Department, Name |
  Select-Object -Property Department, Name

```

## Advanced Demo

```PowerShell

# The sorted data sometimes does not seem to be sorted in the order that you expect
# This is due to hidden data behind what we see on the screen 

Get-Service |
  Sort-Object -Property Status, Name |
  Select-Object -Property Status, StartType, Name
 

```

[Back to Topics](../README.md#morning-session)

