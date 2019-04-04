# AZ-100 Hands-on Labs

* [Microsoft Learning: AZ-100 Microsoft Azure Integration and Security GitHub Labs](https://github.com/MicrosoftLearning/AZ-100-MicrosoftAzureInfrastructureDeployment)

## Day 1

### Module 1

* [View Your Bill](https://docs.microsoft.com/en-us/azure/billing/billing-download-azure-invoice-daily-usage-date)
* [Create and Manage Policies](https://docs.microsoft.com/en-us/azure/governance/policy/tutorials/create-and-manage)

### Module 2

* Users and Groups:
  * [Add new users](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory)
  * [Manage group membership](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-groups-members-azure-portal)
  * [Create a group and add members](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-groups-create-azure-portal)
  * [Manage profile information](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-users-profile-azure-portal)
* RBAC:
  * [Portal](https://docs.microsoft.com/en-us/azure/role-based-access-control/quickstart-assign-role-user-portal)
  * [PowerShell](https://docs.microsoft.com/en-us/azure/role-based-access-control/tutorial-role-assignments-user-powershell)

### Module 3

* [Alerts](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitor-quick-audit-notify-action-in-subscription)
* Activity Log:
  * [Overview](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-activity-log-alerts#overview)
  * [Create an activity log alert](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/alerts-activity-log)
  * [View the Activity Log in the Azure portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-audit)
  * [Configure log profiles using the Azure portal](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs#configure-log-profiles-using-the-azure-portal)
  * [Enable streaming of the Activity Log](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-stream-activity-logs-event-hubs#enable-streaming-of-the-activity-log)
  * [Archive the Activity Log using the portal](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-archive-activity-log#archive-the-activity-log-using-the-portal)
  * [Configure the Activity Log Analytics solution for your workspaces](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-activity#configuration)


### Module 4

* [Visualize Data](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-tutorial-dashboards)
* [Alert on Data](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-tutorial-response)
* Collect and Analyze Data:
  * [Collect data about virtual machines](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-quick-collect-azurevm)
  * [View or analyze data collected with Log Analytics search](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-tutorial-viewdata)
* [Log Analytics Query](https://portal.loganalytics.io/demo#/discover/home)

### Module 5

* [Deploy an ARM Template](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/ps-template)
* [Lock Resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-lock-resources)

### Module 6

_No Hands-on_

### Lab

* [Lab 1: Manage Azure Subscriptions and Resources](https://github.com/MicrosoftLearning/AZ-100-MicrosoftAzureInfrastructureDeployment/blob/master/Instructions/az-100-01__instructions.md)
* [Lab 2: Manage Azure Subscriptions and Resources - Implementing governance and compliance with Azure initiatives and resource locks](https://github.com/MicrosoftLearning/AZ-100-MicrosoftAzureInfrastructureDeployment/blob/master/Instructions/az-100-01b__instructions.md)

## Day 2

### Module 1

* [Use Storage Explorer](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-storage-explorer)

### Module 2

* Virtual Machine Storage:
  * [Attach a data disk to a Windows VM using PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/attach-disk-ps)
  * [Detach a data disk from a Windows virtual machine](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/detach-disk)
  * [Convert Azure managed disks storage from standard to premium, and vice versa](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/convert-disk-storage)
  * [Convert a Windows virtual machine from unmanaged disks to managed disks](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/convert-unmanaged-to-managed-disks)
* Blob Storage:
  * [Upload, download, and list blobs using the Azure portal](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal#upload-a-block-blob)
  * [Upload, download, and list blobs using Azure PowerShell](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-powershell)
* Create a File Share:
  * [Portal](https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share#create-a-file-share-through-the-azure-portal)
  * [PowerShell](https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share#create-file-share-through-powershell)
  
### Module 3

* [Shared Access Signatures](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-storage-explorer#work-with-shared-access-signatures)
* [Configure Azure Backup Reports](https://docs.microsoft.com/en-us/azure/backup/backup-azure-configure-reports#configure-storage-account-for-reports)
* [Backup Azure File Shares](https://docs.microsoft.com/en-us/azure/backup/backup-azure-files)
* Deploy Azure File Sync:
  1. Create a storage account
  1. [Deploy the Storage Sync Service](https://docs.microsoft.com/en-us/azure/storage/files/storage-sync-files-deployment-guide#deploy-the-storage-sync-service)
  1. Create a [Sync Group](https://docs.microsoft.com/en-us/azure/storage/files/storage-sync-files-deployment-guide?tabs=portal#create-a-sync-group-and-a-cloud-endpoint) where you specify an Azure file share to sync with
  1. Create a file share in the storage account
  1. [Register your on-premise or local server](https://docs.microsoft.com/en-us/azure/storage/files/storage-sync-files-deployment-guide?tabs=portal#register-windows-server-with-storage-sync-service) with the storage sync service
  1. Configure the synchronization which involves deploying the [File Sync agent](https://docs.microsoft.com/en-us/azure/storage/files/storage-sync-files-deployment-guide?tabs=portal#install-the-azure-file-sync-agent)
  1. [Add a server endpoint](https://docs.microsoft.com/en-us/azure/storage/files/storage-sync-files-deployment-guide?tabs=portal#create-a-server-endpoint)

### Module 4

* Optimize Your Content Delivery:
  * [Enable Azure CDN](https://docs.microsoft.com/en-us/azure/cdn/cdn-create-new-endpoint)
    * [Create a new CDN profile](https://docs.microsoft.com/en-us/azure/cdn/cdn-create-new-endpoint#create-a-new-cdn-profile)
    * [Create a new CDN endpoint](https://docs.microsoft.com/en-us/azure/cdn/cdn-create-new-endpoint#create-a-new-cdn-endpoint)
  * [Create Caching Rules](https://docs.microsoft.com/en-us/azure/cdn/cdn-caching-rules-tutorial)
    * [Access the azure CDN caching rules page](https://docs.microsoft.com/en-us/azure/cdn/cdn-caching-rules-tutorial#open-the-azure-cdn-caching-rules-page)
    * [Set global caching rules](https://docs.microsoft.com/en-us/azure/cdn/cdn-caching-rules-tutorial#set-global-caching-rules)
    * [Set custom caching rules](https://docs.microsoft.com/en-us/azure/cdn/cdn-caching-rules-tutorial#set-custom-caching-rules)
* Azure Import/Export Tool:
  * [Install and set up the Azure Import/Export Tool](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-setup?toc=/azure/storage/blobs/toc.json)
  * [Prepare your hard drives for a job where you import data from your drives to Azure Blob Storage](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-preparing-hard-drives-import?toc=/azure/storage/blobs/toc.json)
  * [Review the status of a job with Copy Log Files](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-reviewing-job-status-v1?toc=/azure/storage/blobs/toc.json)
  * [Repair an import job](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-repairing-an-import-job-v1?toc=/azure/storage/blobs/toc.json)
  * [Repair an export job](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-repairing-an-export-job-v1?toc=/azure/storage/blobs/toc.json)
  * [Troubleshoot the Azure Import/Export Tool](https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-tool-troubleshooting-v1?toc=/azure/storage/blobs/toc.json)

### Module 5

* [Audit and receive notifications about important actions in your Azure subscription](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitor-quick-audit-notify-action-in-subscription)
* Activity Log:
  * [Query the Activity Log in the Azure portal](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs#query-the-activity-log-in-the-azure-portal)
  * [Create an activity log alert](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-activity-log-alerts#create-an-alert-classic-on-an-activity-log-event-with-a-new-action-group-by-using-the-azure-portal)
  * [Configure log profiles using the Azure portal](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs#configure-log-profiles-using-the-azure-portal)
  * [Enable streaming of the Activity Log](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-stream-activity-logs-event-hubs#enable-streaming-of-the-activity-log)
  * [Archive the Activity Log using the portal](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-archive-activity-log#archive-the-activity-log-using-the-portal)
  * [Configure the Activity Log Analytics solution for your workspaces](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-activity#configuration)

### Lab - Implement and Manage Storage

* [Lab 1: Implement and Manage Storage](https://github.com/MicrosoftLearning/AZ-100-MicrosoftAzureInfrastructureDeployment/blob/master/Instructions/az-100-02__instructions.md)
* [Lab 2: Implement Azure File Sync](https://github.com/MicrosoftLearning/AZ-100-MicrosoftAzureInfrastructureDeployment/blob/master/Instructions/az-100-02b__instructions.md)

## Day 3

### Module 1

_No hands-on_

### Module 2

* [Create a Windows Virtual Machine](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-portal)
* [Connect to a Windows VM](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/connect-logon)
* [Create a Virtual Machine (PS)](https://docs.microsoft.com/en-us/azure/virtual-machines/scripts/virtual-machines-windows-powershell-sample-create-vm#sample-script)
* [Creating Virtual Machines (Template)](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-create-first-template)

### Module 3

* [Create a Custom Image](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-custom-images)

### Module 4

* IP Addresses:
  * [Static public IP address (Azure portal)](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-deploy-static-pip-arm-portal#create-a-vm-with-a-static-public-ip)
  * [Static private IP address (Azure portal)](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-static-private-ip-arm-pportal)
  * [Static public IP Address (PS)](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-deploy-static-pip-arm-ps)
  * [Static private IP Address (PS)](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-static-private-ip-arm-ps#create-a-vm-with-a-static-private-ip-address)
* [Network Security Groups](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-create-nsg-arm-pportal)
* [VMs with Multiple NICs](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/multiple-nics?toc=/azure/virtual-network/toc.json#create-a-vm-with-multiple-nics)

### Module 5

* [Scale Sets](https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets/quick-create-portal)
* [Autoscale](https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets/virtual-machine-scale-sets-autoscale-portal)
* [Custom Script Extensions](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-automate-vm-deployment?toc=/en-us/azure/virtual-machines/extensions/toc.json&bc=/en-us/azure/bread/toc.json)

### Module 6

* [Virtual Machine Backup and Restore](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-backup-vms)
* [Advisor Recommendations](https://docs.microsoft.com/en-us/azure/advisor/advisor-get-started)
* Managing Virtual Machines:
  * [Move a Windows VM to another Azure subscription or resource group](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/move-vm)
  * [Resize a VM](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/resize-vm)
  * [Change the OS disk used by an Azure VM using PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/os-disk-swap)
  * [Download the template for a VM](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/download-template)
  * Create a snapshot in:
    * [Windows](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/snapshot-copy-managed-disk)
    * [Linux](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/snapshot-copy-managed-disk)

## Day 4

### Module 1

* [Virtual Networks](https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-portal)
* [Routing](https://docs.microsoft.com/en-us/azure/virtual-network/tutorial-create-route-table-portal)

