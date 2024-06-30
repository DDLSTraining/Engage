---
lab:
    title: 'Lab: Discovering Objects' 
    module: 'Module 1: PowerShell Basics'
--- 

<!--

<details><summary>Click for hint</summary><Strong> 

``` 
HINT
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
    
```
ANSWER
```
</Strong></details> 


-->


###### _



# Lab: Discovering Objects

## Scenario

You have been asked to discover what is inside a PowerShell object and you have been asked to use the Get-Member command to display the membership of the object produced by the following commands:

Get-Service
Get-Process
Get-Date

## Objectives

After completing this lab, you'll be able to:

- Use Get-Member to discover the type of object produced by a command
- Use Get-Member to discover which Methods are in a PowerShell Object
- Use Get-Member to discover which Properties are in a PowerShell Object


## Estimated time: 60 minutes

## Lab Setup

Virtual machines: **AZ-040T00A-LON-DC1** and **AZ-040T00A-LON-CL1**

User name: **Adatum\\Administrator**

Password: **Pa55w.rd**

## Lab Startup

1. Select  **LON-DC1**.
1. Sign in by using the following credentials:
   - User name: **Administrator**
   - Password: **Pa55w.rd**
   - Domain: **Adatum**

1. Repeat these steps for **LON-CL1**.

##  Exercise 1: Find the types of objects produced by these commands: Get-Service, Get-Process, Get-Date

### Exercise scenario 1

To discover the type of objects produced from the Get-Service command you will need to pipeline the commands into the Get-Member command and then look for the TypeName value

<details><summary>Click for hint</summary><Strong> 

``` 
# How do you pipeline the result of the first command into another command
# Inspecting the results of the Get-Member command, what is the TypeName of the object 
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
 
```
Get-Service | Get-Member

#TypeName: System.ServiceProcess.ServiceController
```
</Strong></details> 

To discover the type of objects produced from the Get-Process command you will need to pipeline the commands into the Get-Member command and then look for the TypeName value

<details><summary>Click for hint</summary><Strong> 

```
# How do you pipeline the result of the first command into another command
# Inspecting the results of the Get-Member command, what is the TypeName of the object 
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
    
```
Get-Process | Get-Member

# TypeName: System.Diagnostics.Process
```
</Strong></details> 

To discover the type of objects produced from the Get-Date command you will need to pipeline the commands into the Get-Member command and then look for the TypeName value

<details><summary>Click for hint</summary><Strong> 

``` 
# How do you pipeline the result of the first command into another command
# Inspecting the results of the Get-Member command, what is the TypeName of the object 
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
    
```
Get-Date | Get-Member

# TypeName: System.DateTime
```
</Strong></details> 
    



### Task 1: Start the console application as Administrator, and pin the Windows PowerShell icon to the taskbar

1. On **LON-CL1**, start the **Windows PowerShell** application as **Administrator**. Make sure that the window title bar reads **Administrator** and doesn't include the text (x86). This indicates that it's the 64-bit console application and that an administrator is running it.
1. Pin the Windows PowerShell icon to the taskbar.

### Task 2: Configure the Windows PowerShell console application

1. Open **Windows PowerShell Properties**, and then configure Windows PowerShell to use the **Consolas** font with **16**-point size.
2. From the **Colors** tab, select alternate display colors for the primary text and background.
3. From the **Layout** tab, size the window to fit on the screen and remove any horizontal scroll bar.



### Exercise 1 results

After completing this exercise, you'll have opened and configured the Windows PowerShell console application and its appearance and layout.

## \[OPTIONAL] Exercise 2: Configuring the Windows PowerShell ISE application

### Exercise Scenario 2

In this exercise, you'll customize the appearance of the Windows PowerShell ISE application.

The main tasks for this exercise are:

1. Open the Windows PowerShell ISE application as Administrator.
1. Customize the appearance of the ISE to use the single-pane view, hide the **Command** pane, and adjust the font size.

### Task 1: Open the Windows PowerShell ISE application as Administrator

1. Right-click the **Windows PowerShell** icon on the taskbar or activate its context menu, and then open the **Windows PowerShell ISE** application as **Administrator**.

### Task 2: Customize the ISE's appearance to use a single-pane view, hide the Command pane, and adjust the font size

1. Configure the ISE to use the single-pane view and display the console pane.
2. Hide the **Command** pane.
3. Adjust the font size so that you can review it comfortably.
4. Close the **Windows PowerShell ISE** and the **Windows PowerShell** windows.

### Exercise 2 results

After completing this exercise, you'll have customized the appearance of the Windows PowerShell ISE application.

## Exercise 3: Finding and running Windows PowerShell commands

### Exercise Scenario 3

In this exercise, you'll use Windows PowerShell’s **Get-Help** and **Get-Command** commands to discover new commands that can complete specific tasks within Windows PowerShell. You'll also run several basic Windows PowerShell commands. In some instances, you might have to find the commands that you'll use to complete the task.

The main tasks for this exercise are:

1. Find commands that'll accomplish specified tasks.
1. Run commands to accomplish specified tasks.

### Task 1: Find commands that'll accomplish specified tasks

- On **LON-CL1**, ensure that you're signed in as **Adatum\\Administrator** and determine the answers to the following questions:

  - What command would you run to resolve a DNS name?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command *resolve* 
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Resolve-DNSName
    ```
    </Strong></details>  
  - What command would you run to make changes to a network adapter? After finding such a command, what parameter would you use to change its Media Access Control (MAC) address (on adapters that support changes to their MAC address)?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell 
    Get-Command *adapter* 
    ```
    
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 

    ```PowerShell
    Get-Help Set-NetAdapter -ShowWindow
    ```
    
    ```PowerShell
    Set-NetAdapter -MacAddress aabbccddeeff
    ```
    </Strong></details>   
  - What command would let you enable a previously disabled scheduled task?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command *sched* 
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Enable-ScheduledTask
    ```
    </Strong></details> 
  - What command would let you block a particular user's access to a shared directory?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command -Verb Block 
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Block-SmbShareAccess
    
    # You could use Block-FileShareAccess, however this will set 
    # The block permission at both the share and the NTFS file level permissions
    # at the same time. The Block-SmbShareAccess only sets the block at the 
    # share level permissions.
    ```
    </Strong></details>   
  - What command would you run to clear your computer’s local **BranchCache** cache?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command -Name *cache*
    
    # OR
    
    Get-Command -Module BranchCache
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Clear-BCCache
    
    # Notice the BranchCache is denoted by the prefix on the Noun (BC)
    ```
    </Strong></details>   
  - What command would you run to display a list of Windows Firewall rules? What parameter of that command would display only enabled rules?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command *firewall* 
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-Help Get-NetFirewallRule -ShowWindow
    ```
    
    ```PowerShell
    Get-NetFirewallRule -Enabled True
    ```
    </Strong></details>  
  - What command would you run to display a list of all locally bound IP addresses?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command *address* 
    
    # OR 
    
    Get-Command Get*address* 
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-NetIPAddress
    ```
    </Strong></details>  
  - What command would you run to suspend an active print job in a print queue?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command -Verb Suspend
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Suspend-PrintJob
    ```
    </Strong></details>  
  - What native Windows PowerShell command would you run to review the content of a text file?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command -Noun *content* 
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-Content
    ```
    </Strong></details>  
  
### Task 2: Run commands to accomplish specified tasks

1. Ensure you are signed in on the **LON-CL1** virtual machine as **Adatum\\Administrator**.

3. Display a list of all local IPv4 addresses.
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Help Get-NetIPAddress -ShowWindow
    
    # OR 
    
    Get-Help Get-NetIPAddress -Full
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-NetIPAddress -AddressFamily IPv4
    ```
    </Strong></details> 

4. Set the startup type of the BITS service to **Automatic**:

    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command -Noun Service
    ```
    </Strong></details> 
    <details><summary>Click to see the answer (Part 1)</summary><Strong> 
    
    ```PowerShell
    Get-Help Set-Service -ShowWindow
    ```
    </Strong></details>     
    
    </Strong></details> 
    <details><summary>Click to see the answer (Part 2)</summary><Strong> 
    
    ```PowerShell
    Set-Service -Name BITS -StartupType Automatic
    ```
    </Strong></details> 
    
5. Test the network connection to **LON-DC1**. Your command should return only a True or False value, without any other output.
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command -Verb Test
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-Help Test-NetConnection -ShowWindow
    ```
    
    ```PowerShell
    Test-NetConnection -ComputerName LON-DC1 -InformationLevel Quiet
    ```
    </Strong></details> 
6. Display the 10 most recent entries from the local Security event log.
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Command *Event*
    # Use Get-WinEvent on PowerShell 7.x and Get-EventLog on Windows PowerShell
    ```
    </Strong></details> 
    <details><summary>Click to see the answer (Part 1)</summary><Strong> 
    
    ```PowerShell
    # If you are using PowerShell 7.x
    Get-Help Get-WinEvent -ShowWindow
    ```

    ```PowerShell
    # If you are using Windows PowerShell
    Get-Help Get-EventLog -ShowWindow
    ```
    </Strong></details> 
    
    <details><summary>Click to see the answer (Part 2)</summary><Strong> 

    ```PowerShell
    # If you are using PowerShell 7.x
    Get-WinEvent -Logname Security -MaxEvents 10
    ```

    ```PowerShell
    # If you are using Windows PowerShell
    Get-EventLog -Logname Security -Newest 10
    ```    
    </Strong></details>

8. Find a command that can create a transcript of the input and output of PowerShell commands.

    - Start a transcript, and then run these commands:
      - Get-Service
      - Get-Process
      - Get-Banana (This will produce an error, this is expected)
    - Stop the transcript and open the file it produces in Notepad to discover what was captured.  
 
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell 
    Get-Command *Transcript*
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Start-Transcript
    Get-Service
    Get-Process
    Get-Banana
    Stop-Transcript
    ```
    </Strong></details> 


> **Note:** Transcripts of your Windows PowerShell session will save all commands that you enter and the command output to a text file until you stop the transcript 


   
    
### Exercise 3 results

After completing this exercise, you'll have demonstrated your ability to find and run Windows PowerShell commands that perform specific tasks.

## Exercise 4: Using About files

### Exercise Scenario 4

In this exercise, you'll use help discovery techniques to find content in **About** files, and then use that content to answer questions about global Windows PowerShell functionality.

Remember that you must use **Get-Help** and wildcard characters. **About** files aren't commands, **Get-Command** will not be useful in this exercise.

The main task for this exercise is:

- Locate and review **About** help files.

### Task 1: Locate and review About help files

- Ensure that you'll still signed in to **LON-CL1** as **Adatum\\Administrator** from the previous exercise, and answer the following questions:

  - What comparison operator does Windows PowerShell use for wildcard string comparisons and are they typically case-sensitive?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Help About*
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-Help about_Comparison_Operators -ShowWindow
    ```
    </Strong></details> 
  - How would you use `$Env` to display the **COMPUTERNAME** environment variable?
    <details><summary>Click for hint</summary><Strong> 

    ```PowerShell
    Get-Help About*
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    Get-Help about_Environment_Variables -ShowWindow
    ```
    </Strong></details> 

### Exercise 4 results

After completing this exercise, you'll have demonstrated your ability to locate help content in **About** files.

[Back to labs](https://github.com/brentd09/AZ040Labs/blob/main/README.md#powershell-labs)

