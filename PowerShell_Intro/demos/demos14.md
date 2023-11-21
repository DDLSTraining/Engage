# Work with scripting constructs in Windows PowerShell

```PowerShell
# if example




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
  }
} while ($LottoNumbers.Count -ne 6)
Write-Host -ForegroundColor cyan "Here are your numbers $LottoNumbers"
```

[Back to Topics](../README.md#afternoon-session)
