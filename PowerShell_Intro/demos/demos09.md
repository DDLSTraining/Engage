# Send and pass data as output from the pipeline

## Basic Demo

```PowerShell

# Save Processes as a CSV text file

Get-Process | 
  Sort-Object -Property WorkingSet, Name -Descending | 
  Select-Object -Property Name, Id, WorkingSet -first 10 |
  ConvertTo-Csv |
  Out-File .\TopProcessList.csv

```

## Intermediate Demo

```PowerShell

# Save Processes as a CSV text file removing the TypeInformation
# Type Information can prevent the simple importing of the CSV into spreadsheets and databases

Get-Process | 
  Sort-Object -Property WorkingSet, Name -Descending | 
  Select-Object -Property Name, Id, WorkingSet -first 10 |
  ConvertTo-Csv  -NoTypeInformation |
  Out-File .\TopProcessList.csv

# Save Processes as a JSON text file

Get-Process | 
  Sort-Object -Property WorkingSet, Name -Descending | 
  Select-Object -Property Name, Id, WorkingSet -first 10 |
  ConvertTo-Json |
  Out-File .\TopProcessList.json

```

## Advanced Demo

```PowerShell
# Save Process information as an HTML text file with CSS formatting

Get-Process | 
  Sort-Object -Property WorkingSet, Name -Descending | 
  Select-Object -Property Name, Id, WorkingSet -first 10 |
  ConvertTo-html -Head @'
<style>
  table {font-family: Arial, Helvetica, sans-serif;border-collapse: collapse;width: 100%;}
  td, th {border: 1px solid #ddd; padding: 8px;}
  tr:nth-child(even){background-color: #f2f2f2;}
  tr:hover {background-color: #ddd;}
  th {  padding-top: 12px;  padding-bottom: 12px;  text-align: left;  background-color: #04AA6D;  color: white;}
</style>
'@ |  Out-File .\TopProcessList.html

```

[Back to Topics](../README.md#afternoon-session)

