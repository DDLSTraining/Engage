# Enumerate objects in the pipeline

```PowerShell
# To show filenames and the amount of disk space each are using:
Get-ChildItem -path C:\Windows -File | ForEach-Object {
  Write-Host $_.Name is taking $_.Length bytes of disk space
}
```

[Back to Topics](../README.md#morning-session)

