# Enumerate objects in the pipeline

## Basic Demo

```PowerShell

# Pipelines will automatically enumerate the objects to the next command
Get-Service -Name Notepad | Stop-Service -WhatIf


```

## Intermediate Demo

```PowerShell

# Produce 10 random numbers
1..10 | Foreach-Object {Get-Random}

```

## Advanced Demo

```PowerShell

# Getting the number of lines in each file
Get-ChildItem -Path C:\windows -Filter *.ini | ForEach-Object {
    $Content = Get-Content $_.FullName
    Write-Host File: $_.Name - Number of lines: $Content.Count
}

```


[Back to Topics](../README.md#morning-session)

