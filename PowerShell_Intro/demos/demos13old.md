# Search in PowerShell Gallery for a module

[powershellgallery.com](https://powershellgallery.com)

- Search the gallery for something that your company uses
  - Cisco
  - VMware
  - SCCM
  - Citrix
  


# Create and run scripts by using Windows PowerShell

```PowerShell
# Create a script that changes all of the users in London from the Sales department to "London Sales"

$SalesUsers = Get-ADUser -filter * -Properties City,Department | Where-Object {$_.Department -eq 'Sales' -and $_.City -eq 'London'}
$SalesUsers | Foreach-Object {
  Set-ADUser -Identity $_ -Department 'London Sales'
}
```


[Back to Topics](../README.md#afternoon-session)

