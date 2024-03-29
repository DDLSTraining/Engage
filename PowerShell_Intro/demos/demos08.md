# Enumerate objects in the pipeline

## Basic Demo

```PowerShell

# Pipelines will automatically enumerate the objects to the next command

Get-Process -Name Notepad | Stop-Process -WhatIf
```

## Intermediate Demo

```PowerShell

# Produce 10 random numbers
# (This will not produce random numbers between 1 and 10)

1..10 | Foreach-Object {Get-Random}

# This will produce 5 random numbers

'a', 'b' ,'c' ,'d' ,'e' | Foreach-Object {Get-Random}
```

## Advanced Demo

```PowerShell

# Getting the number of lines in each file

Get-ChildItem -Path C:\windows -Filter *.ini | ForEach-Object {
    $Content = Get-Content $_.FullName
    Write-Host File: $_.Name - Number of lines: $Content.Count
}

```


[Back to Topics](../README.md#afternoon-session)


