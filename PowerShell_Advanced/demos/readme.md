# Demos

## Class Demo with overloaded method

```PowerShell
class MathHelper {
  [double]$Number1
  [double]$Number2
  [double]$Result

  MathHelper ([double]$Num1,[double]$Num2) {
    $this.Number1 = $Num1
    $this.Number2 = $Num2
    $this.Result = 0
  }

  [void]Multiply() {
    if ($this.Number1 -and $this.Number2) {
      $this.Result = $this.Number1 * $this.Number2
    }  
  }

  [void]Multiply([double]$Num1,[double]$Num2) {
    $this.Number1 = $Num1
    $this.Number2 = $Num2
    $this.Result = $Num1 * $Num2
  }

  [double]ShowMultiply([double]$Num1,[double]$Num2) {
    $this.Number1 = $Num1
    $this.Number2 = $Num2
    $this.Result = $Num1 * $Num2
    return $this.Result
  }
}

$Maths = [MathHelper]::New(34,3)

$Maths.Multiply()
$Maths

$Maths.Multiply(22,6)
$Maths

$Maths.ShowMultiply(34,88)


$Maths | Get-Member
```
