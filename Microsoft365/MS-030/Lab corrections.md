MS-030 Lab Issues

Pays to UpDate Edge with Chrome engine or install Chrome on VM CLIs

PreLiminary Lab - Step 4 may fail (ignore)
Step 9 If DNS Registration Fails - restart OS

Mod 1
Step 27 should juts be Host name (or domain will be added twice)
Task 2 - Step 2 Choose Skip This Step on Add other Records - (Under More options)

Mod 2
Task 1 step 10 - Allocate E5 licence - ALSO Lyndsay's Username will only offer M365x... suffix (ignore the reference to adatumxxx)
Exercise 2 Task 2 Remove Licence for Diego, Isaiah, Nestor,Patti, Joni, Lindsayif you need more licences
Task 3 Delete all users but 2 from the Notepad doc (lack of licences) -Ensure the path for the Imported users matches where the csv file you editied is.
This should be C:\Labfiles

Mod3
Exercise 1 Step 5 Tick Exchange and Skype then Select Manage DNS (On second Tab)

Task 3 Step 3 (You need to View/Advanced to see Time To Live - Not really necessary)

Step 11 - Select Teams and Skype Check box then choose Continue
Step 12 Choose Close (Ignore SPF record error)

Step 14 choose Outlook (Not Mail)
Step 16 Click Speak Bubble (Chat) top Right Hand corner to Launch Teams - Choose Web App version. Accept default pop up messages (Skype is now Teams)
Step 20 choose Outlook (Not Mail)
Step 22  Click Speak Bubble (Chat) top Right Hand corner to Launch Teams - Choose Web App version. Accept default pop up messages (Skype is now Teams)
Step 24 Type MOD not Holly

Exercise2
Step 3 - Choose Help Identify My Issue with Exchange
Step 10 - Goto SfB/Lync Tab on sidebar menus - Choose Skype for Business Connectivity Test
	Type Francisco@adatumxxxx.onelarndns.comin both email and dmain/username boxes - Ignore the Lync Server error (expected)

Task 2 Step 1Choose SARA Client from SideBar Menu - It will eventually beadded to Start Menu
Step 8 type MOD@adatumXXX (no Holly) - use the MOD password (on Resource tab to the right of Instructions)

Exercise 3
Task 2 Step 1 ( Choose Teams from the Office Apps Screen and install Teams Desktop Client) (You will also need to do this for Cli2)


Mod 4
To get Powershell MSONline to work on DS1 you have to run:

	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

	install-module MSOnline -( If you refer to Mod Exercise 2 step 9 it is the same pasted command)

Be careful ADmin (MOD) password is NOT Pa55w.rd and ont of the 'T' adds a space to the end of admin@adatumxxxxxx.onelearndns.com 

MOD 5
Task 1 >> Step 7, Office 365ProPlus to turn it off option no longer there. Try using "Microsoft 365Apps for the Enterprise". I believe it's the new option.

You will have to skip this step and the test for Cai potentially JUMP to Task 2
Task 2 >> Step 21, If you cannot access the Contoso Site just use local Documents folder. You should be able to though.
Exercise 2 Skip Task 3 & 4 Installing Office Pro Plus the option is no longer available - Try using "Microsoft 365Apps for the Enterprise". I believe it's the new option.

Mod 8 Task 1 "Meeting Settings" Step 2 - The Logo URL wont work. Needs to be a URL to an image (pretty hard nowadays - would ned to be a SharePoint Image Library URL)

Mod 9 Exercise 1 - Task1 Step 4 - Go to Settings (Classic Settings - to see Storage and Yammer etc)
	 Exercise 1 - Task 1 Step 10 (Sharing is back on the Main SharePoint Admin Centre under Polices)
	Task 2 User Profiles is on "More Features" 
	Task 3 Apps is bak on "More Features"
	Exercise 2 Task 1 Step 3 - "More Features" - Classic Site Collection Page"
	Task 2 - The SPoint PShell will put @adatum.... You may need to swap to Admin@M365...both for the Connect and SiteCollection Creation (step 13)
	Exercise 3 task 2 step 11 just use an external email address - Use this address in Task 3 too	
	
Module 10: 
Exercise 1: Task 1: In the Email Settings section, Select A weekly digest of your group messages.- no longer there
Ex 1 Part 2 - Step 9 In the Data Retention Policy page, read the description of available options and Select Soft Delete and then Select Save. - No longer there. 
Now stored in the cloud for ever or subject to SPoint storage
Step 11 - Use Admin@M365x.... for email address Keywords
Task 3:  Step 3 In the Send me a digest of message activity drop-down list, Select weekly - no longer there
Exercise 2 Step 14 You have to select drop list to see Beth Burke's name (these are called bread crumbs!)
Step 20 - It may say Contoso not Adatum
Exercise 3 - task 1 -step 5 (be aware The owner option comes up before the email name)
Step 4 the Powershell command has 361 not 365 in the text
Step 7 use change PShell to read admin@M365x....
Task 3 step 19 - Use Discover Group - Search on Planning - then Join Group

Mod 12
Some of the Reports are no longer available in Admin Centre. You can find euivalents in S&Compliance Centre un der Reports or Threat Management
	


