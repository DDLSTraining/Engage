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

##  Exercise 1: Find the types methods and properties of objects produced by these commands: Get-Service, Get-Process, Get-Date

### Exercise Scenario 1

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
    

### Exercise Scenario 2

To discover the methods in objects produced from the Get-Service command you will need to pipeline the commands into the Get-Member command and then look for all members that have a MemberType of Method

<details><summary>Click for hint</summary><Strong> 

``` 
# How do you pipeline the result of the first command into another command
# Inspecting the results of the Get-Member command, which of the members are methods
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
 
```
Get-Service | Get-Member

#  Name                      MemberType   
#  ----                      ----------   
#  Close                     Method       
#  Continue                  Method       
#  CreateObjRef              Method       
#  Dispose                   Method       
#  Equals                    Method       
#  ExecuteCommand            Method       
#  GetHashCode               Method       
#  GetLifetimeService        Method       
#  GetType                   Method       
#  InitializeLifetimeService Method       
#  Pause                     Method       
#  Refresh                   Method       
#  Start                     Method       
#  Stop                      Method       
#  WaitForStatus             Method       
#  ToString                  ScriptMethod 

```
</Strong></details> 

To discover the type of objects produced from the Get-Process command you will need to pipeline the commands into the Get-Member command and then look for all members that have a MemberType of Method

<details><summary>Click for hint</summary><Strong> 

```
# How do you pipeline the result of the first command into another command
# Inspecting the results of the Get-Member command, which of the members are methods
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
    
```
Get-Process | Get-Member

#  Name                      MemberType 
#  ----                      ---------- 
#  BeginErrorReadLine        Method     
#  BeginOutputReadLine       Method     
#  CancelErrorRead           Method     
#  CancelOutputRead          Method     
#  Close                     Method     
#  CloseMainWindow           Method     
#  CreateObjRef              Method     
#  Dispose                   Method     
#  Equals                    Method     
#  GetHashCode               Method     
#  GetLifetimeService        Method     
#  GetType                   Method     
#  InitializeLifetimeService Method     
#  Kill                      Method     
#  Refresh                   Method     
#  Start                     Method     
#  ToString                  Method     
#  WaitForExit               Method     
#  WaitForInputIdle          Method  
```
</Strong></details> 

To discover the type of objects produced from the Get-Date command you will need to pipeline the commands into the Get-Member command and then look for the TypeName value

<details><summary>Click for hint</summary><Strong> 

``` 
# How do you pipeline the result of the first command into another command
# Inspecting the results of the Get-Member command, which of the members are methods
```
</Strong></details> 
<details><summary>Click to see the answer</summary><Strong> 
    
```
Get-Date | Get-Member

#  Name                 MemberType 
#  ----                 ---------- 
#  Add                  Method     
#  AddDays              Method     
#  AddHours             Method     
#  AddMilliseconds      Method     
#  AddMinutes           Method     
#  AddMonths            Method     
#  AddSeconds           Method     
#  AddTicks             Method     
#  AddYears             Method     
#  CompareTo            Method     
#  Equals               Method     
#  GetDateTimeFormats   Method     
#  GetHashCode          Method     
#  GetObjectData        Method     
#  GetType              Method     
#  GetTypeCode          Method     
#  IsDaylightSavingTime Method     
#  Subtract             Method     
#  ToBinary             Method     
#  ToBoolean            Method     
#  ToByte               Method     
#  ToChar               Method     
#  ToDateTime           Method     
#  ToDecimal            Method     
#  ToDouble             Method     
#  ToFileTime           Method     
#  ToFileTimeUtc        Method     
#  ToInt16              Method     
#  ToInt32              Method     
#  ToInt64              Method     
#  ToLocalTime          Method     
#  ToLongDateString     Method     
#  ToLongTimeString     Method     
#  ToOADate             Method     
#  ToSByte              Method     
#  ToShortDateString    Method     
#  ToShortTimeString    Method     
#  ToSingle             Method     
#  ToString             Method     
#  ToType               Method     
#  ToUInt16             Method     
#  ToUInt32             Method     
#  ToUInt64             Method     
#  ToUniversalTime      Method   
```
</Strong></details> 
    



### Exercise Scenario 3

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
    



