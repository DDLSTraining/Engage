# Classroom Setup

## MIA-CL1 Virtual Machine 🖥️

1. Open `Virtual Machine Settings` via `Hyper-V Manager`.
1. Adjust the `Processor Count` to `4`.
1. Adjust the `Memory` as needed (10240 MB).
1. Set the `Network Adapter` to the `External` virtual switch.
1. Click `OK`.

## MIA-CL1 Network 🖧

1. Connect to the `MIA-CL1` virtual machine via `Hyper-V Manager`.
1. Login with username `Student` and password `Pa55w.rd`.
1. Right Click the `Start Menu` and select `Network Connection`.
1. Open the properties of the `Ethernet` network connection.
1. Set the `IPv4` properties to `Automatic` for both `IP` address and `DNS`.
1. Click `OK`
1. Right click the `Start Menu` and select `System`.
1. Select `Remote Settings`.
1. Enable `Allow remote connections to this computer`.
1. Click `OK`.
1. Open a command prompt and run `ipconfig`.
1. Write down the `IP address` of `MIA-CL1`.
1. Close the `Connect` window.

## MIA-CL1 Desktop 🗔

1. On the host desktop open `Remote Desktop Client` from the `Start Menu`
1. Connect to `MIA-CL1` via its `IP address`.
1. Open Internet Explorer or Edge.
1. Install Firefox.
1. Set Firefox as the default browser.
1. Open `PowerShell` as Administrator.
1. Type `Update-Module -Name AzureRM -Force` and press enter.
1. Obtain the [AllFiles](https://github.com/MicrosoftLearning/20533-ImplementingMicrosoftAzureInfrastructureSolutions/tree/master/Allfiles) `ISO` file from the instructor.
1. On the host use Hyper-V `Connect` to mount the `ISO` file.
1. Inside `MIA-CL1` copy the directories from the `ISO` file to the root of `E:` drive.
   * E:\Configfiles
   * E:\Demofiles
   * E:\Labfiles
   * E:\Modules

## Class Email Address 📧

1. Open [Outlook.com](https://outlook.live.com/owa/).
1. Create a new `Outlook.com` account. Use your last name with the date eg: carthew20180618@outlook.com
1. Use this email address to create your Azure account.

## Azure Account ⚿

1. Open one of the links below and create your Azure account:
   * Azure Pass: https://www.microsoftazurepass.com/
   * Trial Account (Credit Card Required): https://azure.microsoft.com/en-us/free/
1. Follow the steps to create your Azure account.




