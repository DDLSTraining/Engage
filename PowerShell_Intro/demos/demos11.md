
# Manage variables in Windows PowerShell scripts

## Basic Demo
```PowerShell

# Store your name in a variable called MyName

$MyName = 'Brent'

"Hello " + $MyName
```

## Intermediate Demo

```PowerShell
# Store the results (objects) of a command in a variable

$FireWallRules = Get-NetFirewallRule

$FireWallRules
```

## Advanced Demo

```PowerShell
# Convert a string of characters into a date object

[datetime]$Date = '1 Apr 2001 10:30am'

$Date
```

[Back to Topics](../README.md#afternoon-session)

