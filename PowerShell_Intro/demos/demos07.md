# Filter objects out of the pipeline

```PowerShell
# To show only the Service objects that are stopped:
Get-Service | Where-Object {$_.Status -eq 'Stopped'}

# To show only service objects that are running and their name begins with "a"
Get-Service | Where-Object {$_.Status -eq 'Running' -and $_.Name -like "a*"}
```

[Back to Topics](../README.md#morning-session)
