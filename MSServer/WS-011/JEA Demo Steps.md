# Preparation
To continue with this demonstration, you need the following virtual VMs: **WS-011T00A-SEA-DC1, WS-011T00A-SEA-SVR1, and WS-011T00A-SEA-ADM1.**

Sign in to **SEA-ADM1** as **Contoso\Administrator** with the password **Pa55w.rd**.

Open **Windows PowerShell**.

Enter the following commands to create the **DNSOps security group** and add your account to it.

  **New-ADGroup -Name "DNSOps" -path "OU=IT,DC=Contoso,DC=com" -GroupScope Global | Add-ADGroupMember -Members (Get-AdUser -Filter 'name -like "Administrator")** 

Open **Microsoft Edge**, and then in the Favorites toolbar, select **Windows Admin Center**.

Select **SEA-SVR1**, sign in with the previous credentials, and then select **Connect**.

Under **Tools**, select **PowerShell**, and then enter the password **Pa55w.rd**.

Enter the following commands:

  **Cd 'c:\Program Files\WindowsPowerShell\Modules** 

  **Mkdir DNSOps**

  **Cd DNSOps**

  **New-ModuleManifest .\DNSOps.psd1** 

  **Mkdir RoleCapabilities** 

  **Cd RoleCapabilities** 

  **New-PSRoleCapabilityFile -Path .\DNSOps.psrc**

In **SEA-ADM1**, open **File Explorer**, and then navigate to **\\sea-svr1\c$\Program Files\WindowsPowerShell\Modules\DNSops\rolecapabilities**.

Open **DNSOps.psrc** in **Notepad**.

In **Notepad**, replace the line that starts with **# VisibleCmdlets =** with the following text:

  **VisibleCmdlets = @{ Name = 'Restart-Service'; Parameters = @{ Name='Name'; ValidateSet = 'DNS'}}** 

Replace the line that starts with **# VisibleFunctions =** with the following text:

  **VisibleFunctions = 'Add-DNSServerResourceRecord', 'Clear-DNSServerCache','Get-DNSServerResourceRecord','Remove-DNSServerResourceRecord'** 

Replace the line that starts with **# VisibleExternalCommands =** with the following text:

  **VisibleExternalCommands = 'C:\Windows\System32\whoami.exe'** 

**Select File**, then select **Save**.

Close **Notepad.exe**.

In **Windows Admin Center**, in the **SEA-SVR1 PowerShell** window, enter the following command:

  **New-PSSessionConfigurationFile -Path .\DNSOps.pssc -Full** 

In **File Explorer**, open **DNSOPs.pssc** in **Notepad**.

In **Notepad**, replace the line that starts with **SessionType = 'Default'** with the following text:

  **SessionType = 'RestrictedRemoteServer'** 

Replace the line that starts with **#RunAsVirtualAccount = $true** with the following text:

**RunAsVirtualAccount = $true** 

Replace the line that starts with **# RoleDefinitions** with the following text:

  **RoleDefinitions = @{ 'Contoso\DNSOps' = @{ RoleCapabilities = 'DNSOps' };}** 

Select **File**, then select **Save**.

In **Windows Admin Center**, in the **SEA-SVR1 PowerShell** window, enter the following command:

  **Register-PSSessionConfiguration -Name DNSOps -Path .\DNSOps.pssc**

Select **Disconnect**.

In **Windows Admin Center**, select **Overview**, and then select **Restart**.

When prompted, select **Yes**.

Select **Start**.

**Right-click** or access the context menu for **Windows PowerShell**, select **More**, and then select **Run as Administrator**.

Enter the following commands:

  **$dnsopssession = New-PSSession -ComputerName SEA-SVR1 -ConfigurationName DNSOps Import-PSSession -Session $dnsopssession -Prefix DNSOps Get-DNSOpsCommand**

Review the list of available commands.


