# Manage Active Directory Domain Services using PowerShell

## Basic Demo

```PowerShell
# Get a list of all the users in Active Directory

Get-ADUser -Filter * 
```

## Intermediate Demo

```PowerShell
# Get a list of all the users in Active Directory including their department and city

Get-ADUser -Filter * -Properties Department,City
```

## Advanced Demo

```PowerShell
# Get a list of all the users in the Sales department from Active Directory including their department and city
# This is using the filtering from and ADUser command

Get-ADUser -Filter {department -eq 'Sales'} -Properties Department,City
```

[Back to Topics](../README.md#afternoon-session)
