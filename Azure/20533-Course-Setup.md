# 20533 Course Setup

Configurations needed to complete the Azure labs.

## MIA-CL1 Virtual Machine 🖥️

Following are the steps to configure the `MIA-CL1` virtual machine:

1. Open `Hyper-V Manager` on the host machine (shortcut on the desktop).
1. Right Click on the virtual machine named `MIA-CL1` and select `Settings...`.
1. Adjust the `Processor Count` to `4`.
1. Adjust the `Memory` as needed (10240 MB).
1. Set the `Network Adapter` to the `External Network` virtual switch.
1. Click `OK`.
1. Right Click `MIA-CL1` and select `Checkpoint`.
1. Right Click `MIA-CL1` and select `Start`.

## MIA-CL1 Network 🖧

Once `MIA-CL1` is running we need to configure the network:

1. Connect to the `MIA-CL1` virtual machine via `Hyper-V Manager`.
1. Write down the username for future reference.
1. Login with the password `Pa55w.rd`
1. Right Click the `Start Menu` and select `Network Connection`.
1. Depending on the Windows version you may need to do the following:
   1. Click `Ethernet` on the left menu.
   1. Click `Change adapter options` to access the network interface.
1. Right Click the network connection called either `Ethernet` or `Private Network` and select `Properties`.
1. Click on `Internet Protocol Version 4 (TCP/IPv4)` and then click `Properties`.
1. Select the top option `Obtain an IP address automatically`.
1. Select the middle option `Obtain DNS server address automatically`.
1. Click `OK` and then `Close` (select `Yes` if the network side panel shows up).
1. Right click the `Start Menu` and select `System`.
1. Click `Remote Desktop` on the left menu.
1. Click the switch `Enable Remote Desktop` to turn on Remote Desktop.
1. In the Remote Desktop Settings dialog box click `Confirm`.
1. Close any open windows.
1. Use the `Start Menu` to open PowerShell and run `ipconfig`.
1. Write down the `IPv4 address` of `MIA-CL1`.
1. Close the `Virtual Machine Connection` window.

## MIA-CL1 Desktop 🗔

The `MIA-CL1` desktop needs some final changes before we use it for labs:

1. On the host desktop open `Remote Desktop Client` from the `Start Menu`.
1. In the Remote Desktop Client click `Show Options`.
1. Set the `Computer` and `User name` to the IP address and user name values recorded previously.
1. Select `Allow me to save credentials` and save the connection.
1. Click `Connect`.
1. Log in using the user name noted previously and the password `Pa55w.rd`
1. Open Internet Explorer or Edge.
1. Download and install Firefox ([why Firefox and not Chrome?](https://blog.mozilla.org/blog/2017/11/14/introducing-firefox-quantum/)).
1. Set Firefox as the default browser.
1. Open `PowerShell` as Administrator.
1. Type `Update-Module -Name AzureRM -Force` and press enter.
1. Minimize the Remote Desktop connection window and view your local desktop.
1. Obtain the location of the `AllFiles` ISO file from the instructor.
1. Copy the `AllFiles` ISO file to your `D:` drive.
1. On the host use `Hyper-V Manager` to connect to `MIA-CL1`.
1. Use the `Media` menu in `Virtual Machine Connection` to mount the ISO file (insert disk).
1. Inside `MIA-CL1` copy the directories from the `ISO` file to the root of your data partition replacing the existing files.
   * F:\Configfiles
   * F:\Demofiles
   * F:\Labfiles
   * F:\Modules
     
## Courseware

1. Go to [Skillpipe](https://skillpipe.com/en-GB/).
1. Register or login with your account. If registering use a personal email address.
1. Select `Add a Course` and use the code given to you by the instructor.

## Email Address 📧

__Do not use your existing Microsoft accounts to work with the labs!__

1. Open [Outlook.com](https://outlook.live.com/owa/).
1. Create a new `Outlook.com` account. Use your last name with the date eg: lastname20180618@outlook.com
1. Use this email address to create your Azure account.

## Azure Account ⚿

To create an Azure subscription you need to prove you are a person and an adult. This is done with a credit card. If you have been supplied with an Azure Pass you can avoid the need to use a credit card:

1. Open one of the links below and create your Azure account:
   * Azure Pass: https://www.microsoftazurepass.com/
   * Trial Account (Credit Card Required): https://azure.microsoft.com/en-us/free/
1. Follow the steps to create your Azure account.

## Bookmarks

Add the following bookmarks to your browser:

* [Skillpipe](https://skillpipe.com/en-GB/)
* [Azure Portal](https://portal.azure.com/)
* [Course 10979 GitHub Repository](https://github.com/MicrosoftLearning/10979-MicrosoftAzureFundamentals)
* [Course 20533 GitHub Repository](https://github.com/MicrosoftLearning/20533-ImplementingMicrosoftAzureInfrastructureSolutions)
* [This Repository](/Azure)

_Note: Use a private or incongnito browser window if you have issues with accounts being cached._ 


