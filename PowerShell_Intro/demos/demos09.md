# Send and pass data as output from the pipeline

```PowerShell
# Save Processes as a CSV text file
Get-Process | 
  Sort-Object -Property WorkingSet,Name -Descending | 
  Select-Object -Property Name,Id,WorkingSet -first 10 |
  ConvertTo-Csv |
  Out-File TopProcessList.csv

# Save Processes as a JSON text file
Get-Process | 
  Sort-Object -Property WorkingSet,Name -Descending | 
  Select-Object -Property Name,Id,WorkingSet -first 10 |
  ConvertTo-Json |
  Out-File TopProcessList.json

# Save Processes as a HTML text file
Get-Process | 
  Sort-Object -Property WorkingSet,Name -Descending | 
  Select-Object -Property Name,Id,WorkingSet -first 10 |
  ConvertTo-html |
  Out-File TopProcessList.html
```

[Back to Topics](../README.md#afternoon-session)

