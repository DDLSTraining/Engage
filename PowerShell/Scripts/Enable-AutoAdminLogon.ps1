<#
.SYNOPSIS
   Sets the auto logon admin registry keys.

.DESCRIPTION
   This script sets the following registry keys:

   HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
   - DefaultUserName
   - DefaultDomainName
   - DefaultPassword
   - AutoAdminLogin

   The username, domainname, and password can all be passed
   into the script as parameters. The DomainName parameter defaults
   to a "." which is the local computer.

.PARAMETER UserName
   The user you wish to have automatically logged into the system.

.PARAMETER DomainName
   The domain for the user who is going to automatically logged into the system.
   The default value is a "." which means the local host.

.PARAMETER Password
   The password for the Admin account as a Secure String.
   See "ConvertTo-SecureString".

.EXAMPLE
   $password = ConvertTo-SecureString -String "password" -AsPlainText -Force
   Enable-AutoAdminLogon -UserName Administrator -Password $password
#>
[CmdletBinding()]
[OutputType([int])]
Param
(
   [Parameter(Mandatory=$true)]   
   [string]$UserName,

   [Parameter(Mandatory=$false)]
   [string]$DomainName = ".",

   [Parameter(Mandatory=$true)]
   [System.Security.SecureString]$Password
)

$TextPassword = ConvertFrom-SecureString -SecureString $Password -AsPlainText
$WinLogonKey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
New-ItemProperty -Path $WinLogonKey -Name "DefaultUserName" -PropertyType String -Value $UserName -Force | Out-Null
New-ItemProperty -Path $WinLogonKey -Name "DefaultDomainName" -PropertyType String -Value $DomainName -Force | Out-Null
New-ItemProperty -Path $WinLogonKey -Name "DefaultPassword" -PropertyType String -Value $TextPassword -Force | Out-Null
New-ItemProperty -Path $WinLogonKey -Name "AutoAdminLogon" -PropertyType String -Value "1" -Force | Out-Null
