# Azure Course Student Account Setup

## Requirements

* Modern Browser
* Skillpipe Courseware Code
* Azure Pass Code

_Note: Use a private or incongnito browser window if you have issues with accounts being cached._ 

## Firefox

Upgrade Firefox ([why use Firefox?](/Internet/Firefox.md)). If you haven't used it for a while, give it a try this week:

1. Open Firefox from the Start menu.
1. Open the Firefox Menu (The button that looks like three lines at the top right of the browser).
1. Click the help icon (❔) on the bottom of the menu.
1. Click `About` and wait for the download to finish
1. Click `Restart to Upgrade`.
1. Once upgraded, use the `Customize...` menu options to restore defaults.

Some useful extensions:

* [Tree Style Tab](https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/) - Show tabs like a tree.
* [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/) - Finally, an efficient blocker. Easy on CPU and memory.
* [Imagus](https://addons.mozilla.org/en-US/firefox/addon/imagus/) - Enlarge thumbnails, and show images/videos from links with a mouse hover.
* [Octotree](https://addons.mozilla.org/en-US/firefox/addon/octotree/) - Add-on to display GitHub code in tree format.

## Courseware

1. Go to [Skillpipe](https://skillpipe.com/).
1. Register or login to your account. **(When registering, your own personal email address is preferred, try to avoid work email addresses)**
1. Select `Add a Course` and use the **skillpipe code** given to you by a DDLS email or in some cases from the instructor.

## Learn on Demand Labs  (Optional - Ask instructor if this is needed)

***A learn On Demand key would have been given to you either by email or from the instructor***

- Go to [Learn On Demand](https://ddls.learnondemand.net)
- If this is the first time you have used ddls.learnondemand.net
  - Click `Register with Training Key`  
  - Use the LearnOnDemand key you received in an email from DDLS staff or from your trainer
  - Fill in your registration details **(When registering, your own personal email address is preferred)**
  - You will be asked to create your own Login ID. ***(Do not forget this as it is needed to access the VMs)***
- If you have have an account with ddls.learnondemand.net already
  - Click `Sign In`
  - Use your existing username and password
  - Click `Redeem Training Key`
  - Enter the LearnOnDemand key you received in an email from DDLS staff or from your trainer
- Once you have redeemed your code
  - Click on My Training
  - Click the *course name*
  - ***Make sure you view and agree to the Licence agreement*** 
    - Otherwise **you will not** be able to launch the lab machines
  - In the Activities section, you will find your labs
  

## Email Address 📧

__Do not use your existing Microsoft accounts to work with the labs!__

1. Create a throw away email for use in Azure.
1. **DO NOT USE YOUR EXISTING MICROSOFT ACCOUNTS.**
1. Open [Outlook.com](https://outlook.live.com/owa/).
1. Create a new `Outlook.com` account. For Example, use your last name with the date eg: lastname20180618@outlook.com

## Azure Account ⚿

To create an Azure subscription you need to prove you are a person and an adult. This is done with a credit card. If you have been supplied with an Azure Pass you can avoid the need to use a credit card:

1. Use your new `outlook.com` email address in the following steps.
1. DO NOT USE YOUR EXISTING MICROSOFT ACCOUNTS.
1. Use one of the following to create a free Azure account (If you are on an Azure course use the [Azure Pass](https://www.microsoftazurepass.com/) option):
   * Azure Pass: https://www.microsoftazurepass.com/ **Use this option for Azure Class**
   * Trial Account (Credit Card Required): https://azure.microsoft.com/en-us/free/ 
1. Follow the steps to create your Azure account.
  - Click START on the webpage
  - Verify your account
  - Enter the AzurePass Code that was emailed to you
  
## Bookmarks

Add the following bookmarks to your browser:

* [Skillpipe](https://skillpipe.com)
* [Azure Portal](https://portal.azure.com/)
* [Microsoft Learning on GitHub](https://github.com/MicrosoftLearning)
* [Engage Azure Repository](/Azure)

## Classroom Machine Setup (Optional)

The following is specific to the DDLS classroom machines to add useful software packages for working with Azure. Most of the labs commands are run inside [Cloud Shell](https://shell.azure.com/), however you can run them locally with these software packages.

1. Upgrade VSCode:
   * Open VSCode from the start menu (search for `code`).
   * Go to the `Help` menu and then `Check For Updates`.
1. Upgrade Scoop:
   * Open PowerShell.
   * Run the following command: `scoop update`
   * If Scoop is not installed: `iwr -useb get.scoop.sh | iex`
1. Run the following script:

```powershell
scoop bucket add extras
scoop bucket add versions
scoop install pwsh
```

4. Open PowerShell Core from the start menu.
   * _Note: the reason we are using PowerShell Core is because it does not need the latest .NET Framework installed to use the Azure AZ PowerShell module._
5. Run the following script:

```powershell
scoop install 7zip copyq coreutils grep nmap openssh vim wget wireshark docker docker-compose git nodejs jq azure-cli storageexplorer
install-module az -force
```
