# Manage Active Directory Domain Services using PowerShell

```PowerShell
# Get a list of all the users in Active Directory including their department and city
Get-ADUser -Filter * -Properties Department,City

# Get a list of all the users in the Sales department from Active Directory including their department and city
Get-ADUser -Filter {department -eq 'Sales'} -Properties Department,City
```


[Back to Topics](../README.md#afternoon-session)
