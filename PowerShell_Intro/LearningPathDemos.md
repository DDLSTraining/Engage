# Getting to know PowerShell

```PowerShell
# To determine the version of PowerShell that you are using view the contents of this system variable
$PSVersionTable

# To determine what execution policy is running use the following command
Get-ExecutionPolicy



```

[Back to Topics](LearningPath.md)

# Understand the command syntax in Windows PowerShell

```PowerShell
# To list the registered verbs use the following command
Get-Verb

# Parameters can be required
Get-Item

Get-Item -Path C:\Windows 

# Parameters can be optional
Get-Process

Get-Process -Name PowerShell

```

[Back to Topics](LearningPath.md)

# Locating Commands

```PowerShell
# How to look for commands that have something to do with the DNS Client
Get-Command *dns*client*

# Find commands that have something to do with the windows firewall
Get-Command -Noun *FirewallRule

# Find all of the commands that start with the verb Set
Get-Command -Verb Set
```

[Back to Topics](LearningPath.md)

# Using the help system

```PowerShell

```

[Back to Topics](LearningPath.md)

# Understand the Windows PowerShell pipeline

```PowerShell

```

[Back to Topics](LearningPath.md)

# Selecting and Sorting

```PowerShell

```

[Back to Topics](LearningPath.md)

# Filter objects out of the pipeline

```PowerShell

```

[Back to Topics](LearningPath.md)

# Enumerate objects in the pipeline

```PowerShell

```

[Back to Topics](LearningPath.md)

# Send and pass data as output from the pipeline

```PowerShell

```

[Back to Topics](LearningPath.md)

# Manage Active Directory Domain Services using PowerShell

# Manage variables in Windows PowerShell scripts

```PowerShell

```

[Back to Topics](LearningPath.md)

# Work with arrays and hash tables in Windows PowerShell scripts

```PowerShell

```

[Back to Topics](LearningPath.md)

# Create and run scripts by using Windows PowerShell

```PowerShell

```

[Back to Topics](LearningPath.md)

# Work with scripting constructs in Windows PowerShell

```PowerShell

```

