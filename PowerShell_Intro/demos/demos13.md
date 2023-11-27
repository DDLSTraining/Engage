# Create and run scripts by using Windows PowerShell

```PowerShell
# Setting up for the demonstration
New-Item -Path e:\ -Name ScriptDemo -ItemType directory 
New-Item -Path e:\ScriptDemo -Name Text -ItemType directory 
New-Item -Path e:\ScriptDemo -Name Doc -ItemType directory 
New-Item -Path e:\ScriptDemo -Name Log -ItemType directory 
1..3 | ForEach-Object {New-Item -Path e:\ScriptDemo -Name File$_.txt -ItemType File}
1..3 | ForEach-Object {New-Item -Path e:\ScriptDemo -Name File$_.log -ItemType File}
1..3 | ForEach-Object {New-Item -Path e:\ScriptDemo -Name File$_.doc -ItemType File}
1..3 | ForEach-Object {New-Item -Path e:\ScriptDemo -Name File$_.exe -ItemType File}
```

# Create a script that moves the files into the correct sub-directories

<details><summary>Click to see the answer</summary><Strong> 
    
```PowerShell
Set-location e:\ScriptDemo
Get-ChildItem -File | ForEach-Object {
  if ($_.Name -like '*.txt') {Move-Item -Path $_ -Destination .\Text}
  elseif ($_.Name -like '*.log') {Move-Item -Path $_ -Destination .\Log}
  elseif ($_.Name -like '*.Doc') {Move-Item -Path $_ -Destination .\Doc}
  else {Write-Host $_.Name is not being moved to a sub directory}
}
```
</Strong></details> 
[Back to Topics](../README.md#afternoon-session)

