
# Manage variables in Windows PowerShell scripts

```PowerShell
# Store your name in a variable called MyName
$MyName = 'Brent'

# Store the results (objects) of a command in a variable
$SalesUsers = Get-ADUser -Filter {department -eq 'Sales'}

# Convert a string of characters into a date
[datetime]$Date = '1 Apr 2001 10:30am'
```

[Back to Topics](../README.md#afternoon-session)

