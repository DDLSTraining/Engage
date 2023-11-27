# Work with scripting constructs in Windows PowerShell

```PowerShell
# if example
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



# Do Until Loop Example
$LottoNumbers = @()
do {
  $PickNumber = 1..40 | Get-Random
  if ($PickNumber -notin $LottoNumbers) {
    $LottoNumbers += $PickNumber
  }
} until ($LottoNumbers.Count -eq 6)
Write-Host -ForegroundColor cyan "Here are your numbers $LottoNumbers"


# Do While Loop Example
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

[Back to Topics](../README.md#afternoon-session)
