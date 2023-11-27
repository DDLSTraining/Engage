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

Get-ChildItem -Recurse -Directory -Path e:\ScriptDemo
```

## Create a script that moves the files into the correct sub-directories

- The script needs to do the following
  - Change the location to the e:\ScriptDemo directory
  - Copy all the txt files into the Text sub-directory
  - Copy all the doc files into the Doc sub-directory
  - Copy all the log files into the Log sub-directory
  - Report on other files that will not be moved as they do not fit the above criteria


## Script answer

<details><summary>Click to see the answer</summary>
    
```PowerShell
Set-location e:\ScriptDemo
Get-ChildItem -File | ForEach-Object {
  if ($_.Name -like '*.txt') {Move-Item -Path $_ -Destination .\Text}
  elseif ($_.Name -like '*.log') {Move-Item -Path $_ -Destination .\Log}
  elseif ($_.Name -like '*.doc') {Move-Item -Path $_ -Destination .\Doc}
  else {Write-Host $_.Name is not being moved to a sub directory}
}
```
</details> 

[Back to Topics](../README.md#afternoon-session)

