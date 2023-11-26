# Enumerate objects in the pipeline

```PowerShell
# Getting the number of lines in each file
Get-ChildItem -Path C:\windows -Filter *.ini | ForEach-Object {
    $Content = Get-Content $_.FullName
    Write-Host File: $_.Name - Number of lines: $Content.Count
}
```

[Back to Topics](../README.md#morning-session)

