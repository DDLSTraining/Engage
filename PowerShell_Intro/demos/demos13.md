# Work with scripting constructs in Windows PowerShell

## Basic Demo

```PowerShell
# Simple array iteration using foreach

$Colors = "Red", "Green", "Yellow"

foreach ($Color in $Colors) {
  Write-Host -NoNewline "Current color is: "
  Write-Host -ForegroundColor $Color $Color
}

# Pick Lotto numbers using a Do Until Loop

$LottoNumbers = @()
do {
  $PickNumber = 1..40 | Get-Random
  if ($PickNumber -notin $LottoNumbers) {
    $LottoNumbers += $PickNumber
  }
} until ($LottoNumbers.Count -eq 6)
Write-Host -ForegroundColor cyan "Here are your numbers $LottoNumbers"

```

## Intermediate Demo

```PowerShell
# Pick Lotto numbers using a Do While Loop, showing how the numbers build in the array

$LottoNumbers = @()
do {
  $PickNumber = 1..40 | Get-Random
  if ($PickNumber -notin $LottoNumbers) {
    $LottoNumbers += $PickNumber
    "This is the current list of numbers $LottoNumbers" 
  }
} while ($LottoNumbers.Count -ne 6)
Write-Host -ForegroundColor cyan "Here are your numbers $LottoNumbers"
```

## Advanced Demo

```PowerShell
# Using the Continue command

$services = Get-Service

foreach ($service in $services) {
  if ($service.Status -eq 'Running') {
    Write-Output "Service $($service.Name) is already running. Moving to the next one."
    continue
  }
  Write-Output "Service $($service.Name) is not running."
}
```


```PowerShell
# Guessing game
# Using the Break command

#Guess a number between 1 and 500

$GuessThisNumber = 1..500 | Get-Random
$TooHigh = 501
$TooLow  = 0
do {
  $ComputerGuess = [int](($TooHigh+$TooLow)/2)
  if ($ComputerGuess -gt $GuessThisNumber) {
    $TooHigh = $ComputerGuess
    $LastGuessState = 'High'
  }
  elseif ($ComputerGuess -lt $GuessThisNumber) {
    $TooLow = $ComputerGuess
    $LastGuessState = 'Low'
 }
  else {
    Write-Host -ForegroundColor 'Green' "The computer guessed the right number $ComputerGuess"
    break
  }
  if ($LastGuessState -eq 'High') {$Color = 'Red'}
  elseif ($LastGuessState -eq 'Low') {$Color = 'Yellow'}
  else {$Color = 'Green'}
  Write-Host -ForegroundColor $Color "Computer guessed $ComputerGuess but it was too $LastGuessState"
  Start-Sleep -Seconds 1
} until ($ComputerGuess -eq $GuessThisNumber)
```

## Build a Script

### The goal is to create email addresses for most Active Directory users
- All users except those in the CN=Users,DC=Adatum,DC=Com container will get the new email address
- Display any users that are not getting an email address on the screen in yellow
- The email address must be in this format firstname.lastname@adatum.com (example:john.brown@adatum.com)
- The email address must be in all lowercase letters
- When testing this script, use -WhatIf on the appropriate command so that no changes are made
- Once satisfied that the correct users will get the email address run the script again without -WhatIf
- Make sure the email address was set on the relevant users and not on those in the Users container

<details><summary>Click to see the answer</summary><Strong> 
  
```PowerShell
$AllAdUsers = Get-ADuser -Filter *
foreach ($User in $AllAdusers) {
  if ($User.DistinguishedName -like '*CN=Users,DC=Adatum,DC=Com'){
    Write-Host -ForegroundColor Yellow Skipping $User.Name
  }
  else {
    $EmailAddress = $User.GivenName + '.' + $User.Surname + '@adatum.com'
    $EmailAddress = $EmailAddress.ToLower()
    Set-ADUser -Identity $User -EmailAddress $EmailAddress -WhatIf
  }
}

$UserSample = @()
$SalesUsers = Get-ADUser -filter {Department -eq 'Sales'} -Properties EmailAddress
$UserSample += $SalesUsers[0]
$UserSample += Get-ADuser -filter {Name -eq 'Administrator'} -Properties EmailAddress

$UserSample | Select-Object -Property Name, EmailAddress
```
</Strong></details> 




[Back to Topics](../README.md#afternoon-session)
