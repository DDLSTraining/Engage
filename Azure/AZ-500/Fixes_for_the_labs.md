# AZ500 Github lab errors Sept 2020
# https://github.com/MicrosoftLearning/AZ500-AzureSecurityTechnologies/tree/master/Instructions/Labs
If you have multiple subscriptions run the following in the Azure Shell to use the Azure pass subscription:
**Get-AzSubscription** - To get the SubscriptionId

**$context = Get-AzSubscription -SubscriptionId _<Enter your Azure pass Subscription ID here>_**

**Set-AzContext $context**

## Lab 1 – Ex2 Task 1 step 2
2.	Ensure PowerShell is selected in the drop-down menu in the upper-left corner of the Cloud Shell pane.

**Note:** To paste copied text into the Cloud Shell, right-click within the pane window and select **Pane**. Alternatively, you can use the **Shift+Insert** key combination.

**Pane** Should read **Paste**

## Lab 1 – Ex2 Task 2 step 6
6.	In the PowerShell session within the Cloud Shell pane, run the following to identify the name of your Azure AD tenant:
 
  **$domainName = ((Get-AzureAdTenantDetail).VerifiedDomains)[0].Name**

**[0]** added mail into the DNS name I had to use **[1]** 

## Lab 2 – EX 1 Task 2 step 9
The Resource group is already chosen in the scope earlier in step 7

You will need to wait before you test the policy in Task 3 – it can take **20 mins** to apply…


# Lab 4 
Remember the Lab files will be in a different location, wherever you extracted them too. 

# Lab 5 
## EX 1 Task 1 step 2
Extra step had to click **Create** in Azure AD Privileged Identity Management

## EX1 Task 3 step 7 
I had to create the Role then go back in and edit it to make it permanent.
## Ex3 Task 1 Step 19
I had to refresh the portal a few times to see progress
Clean up resources
I couldn’t delete the directory 

# Lab 6

DNS name must be lowercase
## Ex 3 Task 1 step 5
Choose the load balancer to connect through as Adatum\student
Very slow
Also took ages to be able to delete the AdatumSync directory

# Lab 7
## Ex 2 Task 1 Step 5
Don’t create a new VNet use **MyVirtualNetwork** from **Ex 1**

## Ex 2 Task 2 Step 4 
Again don’t create a new VNet use **MyVirtualNetwork** from **Ex 1**

# Lab 8
## Ex 1 Task 3 Step 3
Also need to supply region **“East US”**
Worked the second time through…

# Lab 9
## Ex 1 Task 1 Step 6 
For the name of the ACR replace **AZ500$RANDON$RANDOM** with a name that is globally unique 
To Clean up also delete the resource group **MC_AZ500LAB09_MyKubernetesCluster_eastus**

# Lab 11
Server Auditing was disabled for me

# Lab 14
## Ex 1 Task 2 Step 7
The Install option has moved

## Ex1 Task 3 step 4
Can’t add “Management ports of virtual machines should be protected with just-in-time network access control” entry.

# Lab 15
## Ex1 Task 3 Step 3 
Can’t sort by “Data Sources”
Very slow to activate **JIT**
