# Locating Commands

## Basic Demo

```PowerShell

# List all the commands that are available

Get-Command -Name *

# Show only the commands with the verb Set

Get-Command -Verb Set

# Show only the commands with the Noun Process

Get-Command -Noun Process
```

## Intermediate Demo

```PowerShell

# Find commands that may be difficult to find
# For example: Find a command that tests network connectivity

Get-Command -Name *network*
# This command will not help as none of these commands test for network connectivity
# The next step is to shorten the search criteria

Get-Command -Name *net*
# This will produce the correct command to perform the test, however, there are too many results to make this efficient

Get-Command -Name *net*connect*
# This will reduce the list of commands significantly to help you identify the correct command

```

## Advanced Demo

```PowerShell

# Fimd all the modules that are available

Get-Module -ListAvailable

# Find all of the commands that are in the ActiveDirectory module

Get-Command -Module ActiveDirectory

```

[Back to Topics](../README.md#morning-session)

