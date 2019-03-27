# AZ-101 Hands-on Labs

* [Microsoft Learning: AZ-101 Microsoft Azure Integration and Security GitHub Labs](https://github.com/MicrosoftLearning/AZ-101-MicrosoftAzureIntegrationandSecurity)

## Day 1

### Module 1

* [Discover and Assess](https://docs.microsoft.com/en-us/azure/migrate/tutorial-assessment-vmware)

### Module 2

* [Preparing the Azure Environment](https://docs.microsoft.com/en-us/azure/site-recovery/tutorial-prepare-azure)
* [Preparing Hyper-V Servers](https://docs.microsoft.com/en-us/azure/site-recovery/hyper-v-prepare-on-premises-tutorial)
* [Migrating On-premises Machines](https://docs.microsoft.com/en-us/azure/site-recovery/migrate-tutorial-on-premises-azure)
* [Migrate VMs to Azure (PS)](https://docs.microsoft.com/en-us/azure/site-recovery/hyper-v-azure-powershell-resource-manager#before-you-start)

### Module 3

* [VM Backup and Restore](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-backup-vms)
* Managing Virtual Machines
  * [Move a Windows VM to another Azure subscription or resource group](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/move-vm)
  * [Resize a VM](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/resize-vm)
  * [Change the OS disk used by an Azure VM using PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/os-disk-swap)
  * [Download the template for a VM](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/download-template)
  * Create a snapshot in:
    * [Windows](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/move-vm)
    * [Linux](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/snapshot-copy-managed-disk)
* Azure to Azure:
  * [Set up disaster recovery for Azure VMs to a secondary Azure region](https://docs.microsoft.com/en-us/azure/site-recovery/azure-to-azure-tutorial-enable-replication)
  * [Run a disaster recovery drill for Azure VMs to a secondary Azure region](https://docs.microsoft.com/en-us/azure/site-recovery/azure-to-azure-tutorial-dr-drill)
  * [Fail over and fail back Azure VMs between Azure regions](https://docs.microsoft.com/en-us/azure/site-recovery/azure-to-azure-tutorial-failover-failback)

### Module 4

* [Using Azure Database Migration Service](https://docs.microsoft.com/en-us/azure/site-recovery/vmware-azure-tutorial)
* Azure Import/Export Tool:
  * [Install and set up the Azure Import/Export Tool](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-setup?toc=/azure/storage/blobs/toc.json)
  * [Prepare your hard drives for a job where you import data from your drives to Azure Blob Storage](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-preparing-hard-drives-import?toc=/azure/storage/blobs/toc.json)
  * [Review the status of a job with Copy Log Files](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-reviewing-job-status-v1?toc=/azure/storage/blobs/toc.json)
  * [Repair an import job](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-repairing-an-import-job-v1?toc=/azure/storage/blobs/toc.json)
  * [Repair an export job](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-repairing-an-export-job-v1?toc=/azure/storage/blobs/toc.json)
  * [Troubleshoot the Azure Import/Export Tool](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-troubleshooting-v1?toc=/azure/storage/blobs/toc.json)

### Lab Day 1 - Migrate Servers

* [Lab 1: Implement Azure Site Recovery between Azure regions](https://github.com/MicrosoftLearning/AZ-101-MicrosoftAzureIntegrationandSecurity/blob/master/Instructions/az-101-01__instructions.md)
* [Lab 2: Migrate on-premises Hyper-V VMs to Azure](https://github.com/MicrosoftLearning/AZ-101-MicrosoftAzureIntegrationandSecurity/blob/master/Instructions/az-101-01b__instructions.md)

## Day 2

### Module 1

* [Manage an App Service Plan](https://docs.microsoft.com/en-us/azure/app-service/app-service-plan-manage#create-an-app-service-plan)
* [External ASE](https://docs.microsoft.com/en-us/azure/app-service/environment/create-external-ase)
  * [For a more advanced practice try create an ASE from an Azure Resource Manager (ARM) template](https://docs.microsoft.com/en-us/azure/app-service/environment/create-from-template)
* [Create an ILB with an ASE](https://docs.microsoft.com/en-us/azure/app-service/environment/create-ilb-ase)

### Module 2

* Deployment Slots:
  * [Add a deployment slot](https://docs.microsoft.com/en-us/azure/app-service/web-sites-staged-publishing#add-a-deployment-slot)
  * [Swap deployment slots](https://docs.microsoft.com/en-us/azure/app-service/web-sites-staged-publishing#swap-deployment-slots)
* Azure App Service:
  * [Backup](https://docs.microsoft.com/en-us/azure/app-service/web-sites-backup)
  * [Restore](https://docs.microsoft.com/en-us/azure/app-service/web-sites-restore)

### Module 3

* [Scale Up an App in Azure](https://docs.microsoft.com/en-us/azure/app-service/web-sites-scale#scale-up-your-pricing-tier)
* [Get Started with Auto-Scale](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-autoscale-get-started)
* [Azure Application Gateway](https://docs.microsoft.com/en-us/azure/application-gateway/quick-create-portal)
* Azure Content Delivery Network
  * CDN profile and endpoint
    * [Create a new CDN profile](https://docs.microsoft.com/en-us/azure/cdn/cdn-create-new-endpoint#create-a-new-cdn-profile)
    * [Create a new CDN endpoint](https://docs.microsoft.com/en-us/azure/cdn/cdn-create-new-endpoint#create-a-new-cdn-endpoint)
  * CDN Caching Rules
    * [Access the azure CDN caching rules page](https://docs.microsoft.com/en-us/azure/cdn/cdn-caching-rules-tutorial#open-the-azure-cdn-caching-rules-page)
    * [Set global caching rules](https://docs.microsoft.com/en-us/azure/cdn/cdn-caching-rules-tutorial#set-global-caching-rules)
    * [Set custom caching rules](https://docs.microsoft.com/en-us/azure/cdn/cdn-caching-rules-tutorial#set-custom-caching-rules)

### Module 4
* Function Apps
  * [Function for Blob Storage](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-storage-blob-triggered-function)
  * [Timer Function](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-scheduled-function#create-an-azure-function-app)
* Event Grid
  * [Create and route Blob storage events](https://docs.microsoft.com/en-us/azure/event-grid/blob-event-quickstart-portal)
  * [Route Blob storage events to a custom web endpoint with PowerShell](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-event-quickstart-powershell?toc=/azure/event-grid/toc.json)
  * [Monitor virtual machine changes](https://docs.microsoft.com/en-us/azure/event-grid/monitor-virtual-machine-changes-event-grid-logic-app)
* Service Bus
  * [Service Bus Message Queues](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-quickstart-portal#create-a-queue)
  * Service Bus Templates
    * [Create a namespace](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-resource-manager-namespace)
    * [Create a Service Bus namespace with queue](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-resource-manager-namespace-queue)
    * [Create a Service Bus namespace with topic and subscription](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-resource-manager-namespace-topic)
 * [Logic App Workflow (Advanced)](https://docs.microsoft.com/en-us/azure/logic-apps/tutorial-build-schedule-recurring-logic-app-workflow)
 
 ### Lab Day 2 - Implement and Manage Application Services
 
 * [Lab 1: Implement and Manage Azure Web Apps](https://github.com/MicrosoftLearning/AZ-101-MicrosoftAzureIntegrationandSecurity/blob/master/Instructions/az-101-02__instructions.md)
 * [Lab 2: Monitor changes to Azure resources by using Azure Event Grid and Azure Logic Apps](https://github.com/MicrosoftLearning/AZ-101-MicrosoftAzureIntegrationandSecurity/blob/master/Instructions/az-101-02b__instructions.md)
 
 ## Day 3
 
 ### Module 1
 
 * [Standard Load Balancer](https://docs.microsoft.com/en-us/azure/load-balancer/quickstart-load-balancer-standard-public-portal)
 * Load Balancer ARM Deployments
   * [2 VMs in a Load Balancer and load balancing rules](https://azure.microsoft.com/en-us/resources/templates/201-2-vms-loadbalancer-lbrules/)
   * [2 VMs in VNET - Internal Load Balancer and LB rules](https://azure.microsoft.com/en-us/resources/templates/201-2-vms-internal-load-balancer/)
 * Azure Traffic Manager
   * [Priority Traffic Routing](https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-configure-priority-routing-method)
   * [Performance Traffic Routing](https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-configure-performance-routing-method)
   * [Geographic Traffic Routing](https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-configure-geographic-routing-method)
     * [Add, disable, enable, or delete endpoints](https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-manage-endpoints)
   * [Weighted Traffic Routing](https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-configure-weighted-routing-method)
 * [Application Gateway](https://docs.microsoft.com/en-us/azure/application-gateway/quick-create-portal)
   * [Web Application Firewall](https://docs.microsoft.com/en-us/azure/application-gateway/application-gateway-web-application-firewall-portal)
   
### Module 2
 
* [Site-to-Site VPN Connections](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-site-to-site-resource-manager-portal)
  * [Try the Create a Site-to-Site VPN Connection QuickStart template](https://azure.microsoft.com/en-us/resources/templates/201-site-to-site-vpn/)
* [ExpressRoute with Site-to-Site](https://docs.microsoft.com/en-us/azure/expressroute/expressroute-howto-coexist-resource-manager)
   
### Module 3

* [IP Flow Verify](https://docs.microsoft.com/en-us/azure/network-watcher/diagnose-vm-network-traffic-filtering-problem)
* [Next Hop](https://docs.microsoft.com/en-us/azure/network-watcher/diagnose-vm-network-routing-problem)
* [VPN Diagnostics](https://docs.microsoft.com/en-us/azure/network-watcher/diagnose-communication-problem-between-networks)
* [NSG Auditing (PowerShell)](https://docs.microsoft.com/en-us/azure/network-watcher/network-watcher-nsg-auditing-powershell)
   
### Lab Day 3 - Implement Advanced Virtual Networking
   
  * [Lab 1: Implement Advanced Virtual Networking](https://github.com/MicrosoftLearning/AZ-101-MicrosoftAzureIntegrationandSecurity/blob/master/Instructions/az-101-03__instructions.md)
  * [Lab 2: Use Azure Network Watcher for monitoring and troubleshooting network connectivity](https://github.com/MicrosoftLearning/AZ-101-MicrosoftAzureIntegrationandSecurity/blob/master/Instructions/az-101-03b__instructions.md)
   
 ## Day 4
   
 ### Module 1
 
 _No hands-on_
   
 ### Module 2
 
 * [Conditional Access](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/app-based-mfa)
 * [MFA Authentication Pilot](https://docs.microsoft.com/en-us/azure/active-directory/authentication/tutorial-mfa-applications)
   
 ### Module 3
 
 * [Discover Resources](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-discover-resources#discover-resources)
 * [Assign Directory Roles](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-add-role-to-user)
 * [Activate and Deactivate PIM Roles](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-activate-role)
 * Directory Roles (General):
   * [How to give other admins access to PIM](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-give-access-to-pim)
   * [How to add or remove a user role](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-add-role-to-user)
   * [How to activate or deactivate a role](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-activate-role)
   * [How to change or view the default activation settings for a role](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-change-default-settings)
   * [How to configure security alerts](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-configure-security-alerts)
   * [How to start an access review](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-start-security-review)
   * [How to perform an access review](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-perform-security-review)
   * [How to complete an access review](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-complete-review)
   * [How to require MFA](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-require-mfa)
   * [How to use the audit log](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-use-audit-log)

 ### Lab Day 4 - Secure Identities
   
 * [Lab 1: Secure Identities](https://github.com/MicrosoftLearning/AZ-101-MicrosoftAzureIntegrationandSecurity/blob/master/Instructions/az-101-04__instructions.md)
 * [Lab 2: Implement and validate Azure AD Identity Protection](https://github.com/MicrosoftLearning/AZ-101-MicrosoftAzureIntegrationandSecurity/blob/master/Instructions/az-101-04b__instructions.md)
   
   

