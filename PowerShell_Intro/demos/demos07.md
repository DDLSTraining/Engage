# Filter objects out of the pipeline

## Basic Demo

```PowerShell
# When filtering objects, comparison operators are used to assess a condition
# To get help "about" the concept of comparison operators

Get-Help -Name About_Comparison_Operators -ShowWindow

# To show only the Service objects that are stopped:

Get-Service | Where-Object Status -eq 'Stopped'
# (This basic syntax has many limitations, hence, it is not preferred)
```

## Intermediate Demo

```PowerShell
# To show only the Service objects that are stopped using the advanced syntax
# (This syntax is preferred)

Get-Service | Where-Object {$_.Status -eq 'Stopped'}
```

## Advanced Demo

```PowerShell
# To show only service objects that are running and that have a name beginning with "a"

Get-Service | Where-Object {$_.Status -eq 'Running' -and $_.Name -like "a*"}

# To show only process objects that have a name greater than 10 characters or a name that begins with "w"

Get-Process | Where-Object {$_.Name.Length -gt 10 -or $_.Name -like "w*"}
```


[Back to Topics](../README.md#morning-session)
