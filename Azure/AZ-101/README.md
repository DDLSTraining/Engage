# AZ-101 Microsoft Azure Integration and Security

## Resources

* [DDLS: Microsoft AZ-101 – Microsoft Azure Integration and Security](https://www.ddls.com.au/courses/microsoft/azure/microsoft-az-101-azure-integration-and-security/)
* [AZ-101 GitHub Repository (Lab files and instructions)](https://github.com/MicrosoftLearning/AZ-101-MicrosoftAzureIntegrationandSecurity)
* [Exam AZ-101: Microsoft Azure Integration and Security](https://www.microsoft.com/en-us/learning/exam-az-101.aspx)

## Suggested Order and Timing

* [AZ-101T01 Day 1 - Migrate Servers to Azure](#day1)
* [AZ-101T02 Day 2 - Implement and Manage Application Services](#day2)
* [AZ-101T03 Day 3 - Implement Advanced Virtual Networking](#day3)
* [AZ-101T04 Day 4 - Secure Identities](#day4)

<a id="day1"></a>
### AZ-101T01 Day 1 - Migrate Servers to Azure

Notes:

* Introduce cloud environments and concepts.
* If possible, install a Windows VM into Hyper-V on the students desktop.
* If you wish to install the Site Recovery Agent on the classroom machines, enable the Windows Update service.

Videos:

* [M1: Migrating Application to the Cloud](https://www.youtube.com/watch?v=qtRwJUhniAg)
* [M2: Azure Site Recovery](https://channel9.msdn.com/Shows/Azure-Friday/Azure-Site-Recovery/player)

|Module|Activity|Duration|
|-|-|-|
|0|Introductions, courseware, and Azure accounts|1:30|
|Break||15|
|1|Azure Migrate|60|
|1|Video: Migrating Application to the Cloud|15|
|Lunch||60|
|1|Azure Migrate|20|
|2|Azure Site Recovery|40|
|2|Practice: Preparing the Azure Environment|10|
|2|Practice: Preparing Hyper-V Servers|20|
|2|Azure Site Recovery|10|
|Break||15|
|3|Disaster Recovery|30|
|4|Migrating Data|30|
||Remaining Practices if desired||
|Lab|Implement Azure Site Recovery between Azure regions|60|
|Finish|4:30||

<a id="day2"></a>
### AZ-101T02 Day 2 - Implement and Manage Application Services

Notes:

* Module 3 Lesson 1 is mostly a repeat of Module 1 ASE.
* [Event Grid, Event Hubs, and Service Bus](https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services)
* Suggest the lab _Implement and Manage Azure Web Apps_ be done for homework.


|Module-Lesson|Activity|Duration|
|-|-|-|
|0|Review|15|
|1-1|Introducing the Azure App Service Platform|70|
|Break||15|
|1-1|Introducing the Azure App Service Platform|15|
|1-1|Prac: Manage App Service Plan|30|
|1-2|Introducing the Azure App Service Platform|10|
|1-2|Prac: Scaling App Service Environments|15|
|Lunch||60|
|1-2|Prac: External ASE|15|
|2-1|Managing and Securing Web Apps|60|
|2-2|Managing and Securing Web Apps|10|
|Break||15|
|2-3|Managing and Securing Web Apps|15|
|3|Scaling and Performance|30|
|3|Prac: Remaining practice from list|0|
|Finish|4:30 - Module 4 moved to Day 3||

<a id="day3"></a>
### AZ-101T03 Day 3 - Implement Advanced Virtual Networking

Notes:

* Suggest the lab _Implement Advanced Virtual Networking_ as homework.

|Day-Module-Lesson|Activity|Duration|
|-|-|-|
|Review||15|
|D2-M4-L1&2|Deploying Serverless Computing Solutions|60|
|D2-M4-L2|Prac: Function for Blob Storage|15|
|D2-M4-L2|Prac: Timer Function|15|
|D2-M4-L3|Deploying Serverless Computing Solutions|15|
|D2-M4-L3|Prac: Event Grid|30|
|D-2M4-L4|Deploying Serverless Computing Solutions|30|
|Lunch||60|
|D2-M4-L4|Deploying Serverless Computing Solutions|10|
|D2-M4-L3|Prac: Service Bus Message Queues|15|
|D2-M4-L3|Prac: Service Bus Templates|15|
|D2-M4-L4|Prac: LogicApp Workflow (Advanced)|15|
|D3-M1-L1&2|Distributing Network Traffic|20|
|Break||15|
|D3-M1-L2|Distributing Network Traffic|10|
|D3-M1-L2|Prac: Standard Load Balancer|15|
|D3-M1-L2|Prac: Load Balancer ARM Deployments|15|
|D3-M1-L3|Distributing Network Traffic|10|
|D3-M1-L3|Prac: Priority, Performance, Geographic, and Weighted Traffic Routing||
|Finish|4:30||

<a id="day4"></a>
### AZ-101T04 Day 4 - Secure Identities

Notes:

* D3-M2-L1 Prac: Deploying the GW can take some time.

|Day-Module-Lesson|Activity|Duration|
|-|-|-|
|D3-M2-L1&2|Site Connectivity|45|
|D3-M2-L1|Prac: Site-to-Site VPN Connections|20|
|D3-M2-L2|Prac: ExpressRoute with Site-to-Site|15|
|Break||15|
|D3-M3-L1&2&3|Monitoring and Troubleshooting Network Connections|20|
|D3-M3-L2|Prac: IP Flow Verify, Next Hop, VPN Diagnostics, NSG Auditing (PowerShell)|20|
|D4-M1-L1|Introduction to Identity Protection in Azure||
|D4-M2|Using Multi-Factor Authentication (MFA) for Secure Access||
|D4-M3|Azure AD Privileged Identity Management||
|Lab|Secure Identities|120|

