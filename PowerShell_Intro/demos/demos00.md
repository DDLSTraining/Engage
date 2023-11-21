# Understanding PowerShell Objects

```PowerShell
# Whenever a command outputs information it is always in the form of an Object
# The Get-Member command displays three major parts of the object created by the Get-Date command:
# - The object type
# - Properties of the object
# - Methods of the object

Get-Date | Get-Member

# To see the information stored in the properties

Get-Date | Select-Object -Property *

# One way we can access properties and methods is via the . (dot) notation
# We will first run the command and store the output in a variable
$CurrentDate = Get-Date

# Now we will access a property or a method
# This will display the current month's number
$CurrentDate.Month

# This will calculate the date that is exactly 6 months before the current date
$CurrentDate.AddMonths(-6)

```

[Back to Topics](../README.md#morning-session)
