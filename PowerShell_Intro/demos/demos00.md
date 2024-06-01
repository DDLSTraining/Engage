# Understanding PowerShell Objects

## Practical Example

![[/../pics/PSObjectLesson.jpg](https://github.com/DDLSTraining/Engage/blob/master/PowerShell_Intro/pics/PSObjectLesson.jpg))


## Basic Demo

```PowerShell
# Whenever a command outputs information it is always in the form of an Object
# The Get-Member command displays three major parts of the object created by the Get-Date command:
# - The object type
# - Properties of the object
# - Methods of the object

Get-Date | Get-Member

# To see the information stored in the properties

Get-Date | Select-Object -Property *
```

## Intermediate Demo

```PowerShell

# One way we can access properties and methods is via the . (dot) notation
# We will first run the command and store the output in a variable
$CurrentDate = Get-Date

# Do the following to view a property of the object
# This will display the current month's number
$CurrentDate.Month

# Do the following to execute a method against the object 
# This will calculate the date that is exactly 6 months before the current date
$CurrentDate.AddMonths(-6)
```

## Advanced Demo

```PowerShell

# A more advanced demo shows how to create a set of objects and how an object can contain other objects
$Engine = [PSCustomObject]@{
  Size         = 3.3
  CylnderCount = 6
  EngineStyle  = 'VShaped'
  FuelType     = 'Petrol'
}

$Car = [PSCustomObject]@{
  Engine = $Engine
  Make   = 'Ford'
  Model  = 'F-150'
  Color  = 'Grey'
  Type   = 'Utility'
}

# This displays all of the Car information
$Car

# This shows the Engine Information
$Car.Engine

# This only shows the engine size in litres 
$Car.Engine.Size


```

[Back to Topics](../README.md#morning-session)
