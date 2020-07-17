# MS-030 Lab Issues

It pays to Update Edge with Chrome engine or install Chrome on VM CLIs

## PreLiminary Lab - 
__Step 4__ may fail (ignore)
__Step 9__ If DNS Registration Fails - restart OS

## Mod 1
__Step 27__ should juts be Host name (or domain will be added twice)
__Task 2 - Step 2__ Choose Skip This Step on Add other Records - (Under More options)

## Mod 2
__Task 1 step 10__ - Allocate E5 licence - ALSO Lyndsay's Username will only offer M365x... suffix (ignore the reference to adatumxxx)
__Exercise 2 Task 2__ Remove Licence for Diego, Isaiah, Nestor,Patti, Joni, Lindsayif you need more licences
__Task 3__ Delete all users but 2 from the Notepad doc (lack of licences) -Ensure the path for the Imported users matches where the csv file you editied is.
This should be C:\Labfiles

## Mod3
__Exercise 1 Step 5__ Tick Exchange and Skype then Select Manage DNS (On second Tab)

__Task 3 Step 3__ (You need to View/Advanced to see Time To Live - Not really necessary)

__Step 11__ - Select Teams and Skype Check box then choose Continue
__Step 12__ Choose Close (Ignore SPF record error)

__Step 14__ choose Outlook (Not Mail)
__Step 16__ Click Speak Bubble (Chat) top Right Hand corner to Launch Teams - Choose Web App version. Accept default pop up messages (Skype is now Teams)
__Step 20__ choose Outlook (Not Mail)
__Step 22__  Click Speak Bubble (Chat) top Right Hand corner to Launch Teams - Choose Web App version. Accept default pop up messages (Skype is now Teams)
__Step 24__ Type MOD not Holly

__Exercise2__
__Step 3__ - Choose Help Identify My Issue with Exchange
__Step 10__ - Goto SfB/Lync Tab on sidebar menus - Choose Skype for Business Connectivity Test
	Type Francisco@adatumxxxx.onelarndns.comin both email and dmain/username boxes - Ignore the Lync Server error (expected)

__Task 2 Step 1__ Choose SARA Client from SideBar Menu - It will eventually beadded to Start Menu
__Step 8__ type MOD@adatumXXX (no Holly) - use the MOD password (on Resource tab to the right of Instructions)

__Exercise 3__
__Task 2 Step 1__ ( Choose Teams from the Office Apps Screen and install Teams Desktop Client) (You will also need to do this for Cli2)


## Mod 4
To get Powershell MSONline to work on DS1 you have to run:

__[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
install-module MSOnline -( If you refer to Mod Exercise 2 step 9 it is the same pasted command)__

Be careful ADmin (MOD) password is NOT __Pa55w.rd__ and that the 'T' adds a space to the end of admin@adatumxxxxxx.onelearndns.com 

## MOD 5
__Task 1 >> Step 7__ Office 365ProPlus to turn it off option no longer there. Try using "Microsoft 365Apps for the Enterprise". I believe it's the new option.

You will have to skip this step and the test for Cai potentially JUMP to Task 2
__Task 2 >> Step 21__ If you cannot access the Contoso Site just use local Documents folder. You should be able to though.
__Exercise 2 Skip Task 3 & 4__ Installing Office Pro Plus the option is no longer available - Try using "Microsoft 365Apps for the Enterprise". I believe it's the new option.

## Mod 8 
__Task 1__ "Meeting Settings" Step 2 - The Logo URL wont work. Needs to be a URL to an image (pretty hard nowadays - would ned to be a SharePoint Image Library URL)

## Mod 9 
__Exercise 1 - Task1 Step 4__ - Go to Settings (Classic Settings - to see Storage and Yammer etc)
__Exercise 1 - Task 1 Step 10__ (Sharing is back on the Main SharePoint Admin Centre under Polices)
__Task 2__ User Profiles is on "More Features" 
__Task 3__ Apps is bak on "More Features"
__Exercise 2 Task 1 Step 3__ - "More Features" - Classic Site Collection Page"
__Task 2__ - The SPoint PShell will put @adatum.... You may need to swap to Admin@M365...both for the Connect and SiteCollection Creation (step 13)
__Exercise 3 task 2 step 11__ just use an external email address - Use this address in Task 3 too	
	
## Module 10: 
__Exercise 1: Task 1:__ In the Email Settings section, Select A weekly digest of your group messages.- no longer there
__Ex 1 Part 2 - Step 9__ In the Data Retention Policy page, read the description of available options and Select Soft Delete and then Select Save. - No longer there. 
Now stored in the cloud for ever or subject to SPoint storage
__Step 11__ - Use Admin@M365x.... for email address Keywords
__Task 3:  Step 3__ In the Send me a digest of message activity drop-down list, Select weekly - no longer there

__Exercise 2 Step 14__ You have to select drop list to see Beth Burke's name (these are called bread crumbs!)
__Step 20__ - It may say Contoso not Adatum

__Exercise 3 - task 1 -step 5__ (be aware The owner option comes up before the email name)
__Step 4__ the Powershell command has 361 not 365 in the text
__Step 7__ use change PShell to read admin@M365x....
__Task 3 step 19__ - Use Discover Group - Search on Planning - then Join Group

## Module 11:

__Unified Labelling__ is the new way :-) this meant an extra step to get the PII label to work:

Under Manage in the __Azure Information Protection__ click __Unified labeling__ then __Copy the policies__ and __Publish__


## Mod 12
Some of the Reports are no longer available in Admin Centre. You can find euivalents in S&Compliance Centre un der Reports or Threat Management
	


