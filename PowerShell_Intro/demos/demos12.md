# Work with arrays and hash tables in Windows PowerShell scripts

```PowerShell
# Creating and accessing elements in an array
$Fruits = @("Apple", "Banana", "Orange", "Grapes")
$Fruits[0]   # Accessing the first element
$Fruits[1]   # Accessing the second element

# Recreating the array with an extra element
$Fruits += "Mango"

# Iterating through an array
foreach ($Fruit in $Fruits) {
    "Processing $Fruit"
}

# Creating an empty ArrayList
[System.Collections.ArrayList]$Colors = $() 

# Adding elements to ArrayList
$Colors.Add("Red")
$Colors.Add("Green")
$Colors.Add("Blue")

# Accessing elements in ArrayList
$Colors[0]

# Removing an element from ArrayList
$Colors.Remove("Green")

# Iterating through ArrayList
foreach ($Color in $Colors) {
    "Processing $Color"
}

# Creating and using a hash table
$Person = @{
    Name     = "John"
    Age      = 30
    Location = "City"
}

# Accessing values in a hash table
$Person.Name
$Person.Age

# Adding or modifying key-value pairs
$Person.Occupation = "Engineer"

# Removing a key-value pair
$Person.Remove("Location")

$listing the key-value pairs in the hash table
$Person
```

[Back to Topics](../README.md#afternoon-session)
