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
# Guessing game
#Guess a number between 1 and 500

$GuessThisNumber = 87
$TooHigh = 501
$TooLow  = 0
do {
  $ComputerGuess = [int](($TooHigh+$TooLow)/2)
  if ($ComputerGuess -gt $GuessThisNumber) {$TooHigh = $ComputerGuess}
  elseif ($ComputerGuess -lt $GuessThisNumber) {$TooLow = $ComputerGuess}
  else {
    Write-Host "The computer guessed the right number $ComputerGuess"
    break
  }
  Write-Host "Computer is guessing $ComputerGuess"
} until ($ComputerGuess -eq $GuessThisNumber)
```

## Build a Script

### The goal is to create email addresses for each Active Directory user
- All users except those in the CN=Users,DC=Adatum,DC=Com container will get the new email address
- The email address must be in this format FirstName.LastName@adatum.com
- When testing this script, use -WhatIf on the appropriate command so that no changes are made
- Once satisfied that the correct users will get the email address run the script again without -WhatIf

<details><summary>Click to see the answer</summary><Strong> 
  
```PowerShell
$AllAdUsers = Get-ADuser -Filter *
foreach ($User in $AllAdusers) {
  if ($User.DistinguishedName -like '*CN=Users,DC=Adatum,DC=Com'){
    Write-Host -ForegroundColor Yellow Skipping $User.Name
  }
  else {
    $EmailAddress = $User.GivenName + '.' + $User.Surname + '@adatum.com'
    Set-ADUser -Identity $User -EmailAddress $EmailAddress -WhatIf
  }
}

```
</Strong></details> 




[Back to Topics](../README.md#afternoon-session)
