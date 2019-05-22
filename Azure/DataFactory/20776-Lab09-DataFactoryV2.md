# Module 9: Automating Data Flow with Azure Data Factory
- [Module 9: Automating Data Flow with Azure Data Factory](#module-9-automating-data-flow-with-azure-data-factory)
    - [Lab: Automating the Data Flow with Azure Data Factory](#lab-automating-the-data-flow-with-azure-data-factory)
    - [Exercise 1: Use Data Factory to back up data from an Azure Data Lake Store to a second ADLS store](#exercise-1-use-data-factory-to-back-up-data-from-an-azure-data-lake-store-to-a-second-adls-store)
        - [Task 1: Verify the data in the original ADLS account](#task-1-verify-the-data-in-the-original-adls-account)
        - [Task 2: Create a second backup ADLS account](#task-2-create-a-second-backup-adls-account)
        - [Task 3: Create new Data Factory](#task-3-create-new-data-factory)
        - [Task 4: Create a Service Principal](#task-4-create-a-service-principal)
        - [Task 5: Assign copy data permissions to the Service Principal](#task-5-assign-copy-data-permissions-to-the-service-principal)
        - [Task 6: Use Copy Wizard to back up data from ADLS1 to ADLS2](#task-6-use-copy-wizard-to-back-up-data-from-adls1-to-adls2)
    - [Exercise 2: Transform uploaded data by running a U-SQL script in an ADLA linked service](#exercise-2-transform-uploaded-data-by-running-a-u-sql-script-in-an-adla-linked-service)
        - [Task 1: Prepare the environment](#task-1-prepare-the-environment)
        - [Task 2: Add the Service Principal as Contributor to the ADLA account](#task-2-add-the-service-principal-as-contributor-to-the-adla-account)
        - [Task 3: Create an Azure Data Lake Analytics linked service](#task-3-create-an-azure-data-lake-analytics-linked-service)
        - [Task 4: Create a Data Lake Store linked service for input and output datasets](#task-4-create-a-data-lake-store-linked-service-for-input-and-output-datasets)
        - [Task 5: Create an Azure Storage Blob linked service for the U-SQL script](#task-5-create-an-azure-storage-blob-linked-service-for-the-u-sql-script)
        - [Task 6: Create Data Lake Store input and output datasets](#task-6-create-data-lake-store-input-and-output-datasets)
        - [Task 7: Create and deploy a new pipeline](#task-7-create-and-deploy-a-new-pipeline)
        - [Task 8: Verify the U-SQL data transformation](#task-8-verify-the-u-sql-data-transformation)
    - [Exercise 3: Transform uploaded data by running an ML model in a Machine Learning linked service](#exercise-3-transform-uploaded-data-by-running-an-ml-model-in-a-machine-learning-linked-service)
        - [Task 1: Prepare the environment](#task-1-prepare-the-environment)
        - [Task 2: Obtain the API key and batch execution URL for a deployed ML model](#task-2-obtain-the-api-key-and-batch-execution-url-for-a-deployed-ml-model)
        - [Task 3: Create an ML linked service](#task-3-create-an-ml-linked-service)
        - [Task 4: Create Azure Storage input and output datasets](#task-4-create-azure-storage-input-and-output-datasets)
        - [Task 5: Create and deploy a new pipeline](#task-5-create-and-deploy-a-new-pipeline)
        - [Task 6: Verify the ML data transformation](#task-6-verify-the-ml-data-transformation)
    - [Exercise 4: Use the Monitoring and Management app to track progress of a pipeline](#exercise-4-use-the-monitoring-and-management-app-to-track-progress-of-a-pipeline)
        - [Task 1: Use the Diagram View to see overall job statuses](#task-1-use-the-diagram-view-to-see-overall-job-statuses)
        - [Task 2: Use filters and views to find specific status information](#task-2-use-filters-and-views-to-find-specific-status-information)
        - [Task 3: Lab clean up](#task-3-lab-clean-up)
  
## Lab: Automating the Data Flow with Azure Data Factory

## Exercise 1: Use Data Factory to back up data from an Azure Data Lake Store to a second ADLS store

### Task 1: Verify the data in the original ADLS account

1. In the Azure portal, click **All resources**, click **adls&lt;_your name_&gt;&lt;_date_&gt;**, and then click **Data explorer**.
2. On the **adls&lt;_your name_&gt;&lt;_date_&gt;** blade, double-click the **Stolen** folder and verify that all the files and folders you imported in Lab07 are still present.

### Task 2: Create a second backup ADLS account

1. In the Azure portal, click **+ Create a resource**, click **Storage**, and then click **Data Lake Storage Gen1**.
2. On the **New Data Lake Store** blade, in the **Name** box, type **adlsbackup&lt;_your name_&gt;&lt;_date_&gt;**.
3. Under **Resource group**, click **Use existing**, and then click **CamerasRG**.
4. In the **Location** list, select the same location as you used for your original Data Lake Store.
5. Leave all other settings at their defaults, and click **Create**.
6. Wait until the storage has deployed before continuing with the lab.

### Task 3: Create new Data Factory

1. In the Azure portal, click **+ Create a resource**, click **Analytics**, and then click **Data Factory**.
2. On the **New data factory** blade, in the **Name** box, type **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;**.
3. Under **Resource group**, click **Use existing**, and then click **CamerasRG**.
4. In the **Version** list, click **V1**.
5. In the **Location** list, from the list of currently available Data Factory regions, select the same location as you used for your Data Lake Stores, or if this is not available, select your nearest location.
6. Click **Create**.
7. Wait until the Data Factory has deployed before continuing with the exercise.

### Task 4: Create a Service Principal

1. In the Azure portal, click **Azure Active Directory**.
2. On the **Azure Active Directory** blade, under **Manage**, click **App registrations**, and then click **New application registration**.
3. On the **Create** blade, enter the following details, and then click **Create**:
    - **Name**: ADLStoDataFactory
    - **Application type**: Web app/ API
    - **Sign-on URL**: https://ADLStoDataFactory/Dummy

    Note that the actual URL entered on this blade is immaterial as you do not actually build or deploy an app at this location. It is simply acting as an identifier.

4. In the **ADLStoDataFactory** blade, next to **Application ID**, click the **Click to copy** button.
5. On the desktop, on the Windows **Start** menu, type Notepad, and then press Enter.
6. In Notepad, type **Application ID**, and then press Enter.
7. On the **Edit** menu, click **Paste**, to store the copied Application ID.
8. In Notepad, on the **File** menu, click **Save**, and save the file as **Auth\_details.txt** in your **Documents** folder.
9. Return to the Azure portal.
10. Click **Settings** blade.
11. On the **Settings** blade, under **API ACCESS**, click **Keys**.
12. On the **Keys** blade, enter the following information, and then click **Save**:
    - **Key description**: Key1
    - **Duration**: In 1 year
13. Copy the **VALUE** generated for **Key1** to the clipboard.
14. Switch to Notepad.
15. Press Ctrl+End, press Enter twice, type **Key1**, press Enter, and then press Ctrl+V to store the API key.
16. Return to the Azure portal.
17. Close the **Keys**, **Settings**, and **ADLStoDataFactory** blades.
18. On the **Azure Active Directory** blade, under **Manage**, click **Properties**.
19. On the **Properties** blade, next to **Directory ID**, click the **Click to copy** button.
20. Switch to Notepad.
21. Press Ctrl+End, press Enter twice, type **Directory ID**, press Enter, and then press Ctrl+V to store the Directory ID.
22. On the **File** menu, click **Save**.

### Task 5: Assign copy data permissions to the Service Principal

1. Switch to the Azure portal.
2. Click **All resources**, click **adls&lt;_your name_&gt;&lt;_date_&gt;**, and then click **Data explorer**.
3. In the Data explorer blade, ensure the root folder (**adls&lt;your name&gt;&lt;date&gt;**) is selected, and then click **Access**.
4. On the **Access** blade, click **+ Add**.
5. On the **Select User or Group** blade, click **ADLStoDataFactory**, and then click **Select**.
6. On the **Select Permissions** blade, select the **Read**, **Write**, and **Execute** check boxes.
7. Under **Add to**, click **This folder and all children**.
8. Under **Add as**, click **An access permission entry and a default permission entry**, and then click **Ok**.

    > **IMPORTANT**. Wait while permissions are assigned to **ADLStoDataFactory**; notice the assignments to each file and folder is displayed in the **Assigning permissions to** box. Do not continue with the exercise until you see the notification that the permissions assignment has successfully completed (this might take several minutes), and the blue assigning graphic becomes a green check mark.

9. Close the **Access** blade.
10. Click **All resources**, click **adlsbackup&lt;_your name_&gt;&lt;_date_&gt;**, and then click **Data explorer**.
11. In the Data explorer blade, click **Access**.
12. On the **Access** blade, click **+ Add**.
13. On the **Select User or Group** blade, click **ADLStoDataFactory**, and then click **Select**.
14. On the **Select Permissions** blade, select the **Read**, **Write**, and **Execute** check boxes.
15. Under **Add to**, click **This folder and all children**.
16. Under **Add as**, click **An access permission entry and a default permission entry**, and then click **Ok**.

    > **Note**: Because there is no data in this Data Lake Store, the permissions assignment process is very quick.

17. Close the **Access** blade.
18. In the Data explorer blade, click **New Folder**.
19. In the **Create New Folder** box, type **Stolen**, and then click **OK**.

### Task 6: Use Copy Wizard to back up data from ADLS1 to ADLS2

1. In the Azure portal, click **All resources**, and then click **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;**.
2. On the **Data Factory** blade, in the **Actions** section, click **Copy data (PREVIEW)**. This action opens a new tab in Internet Explorer.
3. On the **Copy Data** page, in the **Properties** section, in the **Task name** box, type **Traffic DF Copy Pipeline**.
4. In the **Start date time (UTC)** box, click the date, and set it to be five days before today, and then click **Done**.
5. In the **End date time (UTC)** box, click the date, and then click **Now** to set the date to be today, and then click **Done**.
6. On the **Copy Data** page, click **Next**.
7. On the **Source data store** page, click **Azure Data Lake Store**, and then click **Next**.
8. On the **Specify Data Lake Store connection** page, in the **Connection name** box, type **Input Data Lake Store**.
9. In the **Azure subscription** box, select your Azure Pass subscription.
10. In the **Data Lake store account name** box, click **adls&lt;_your name_&gt;&lt;_date_&gt;**.
11. In the **Authentication type** box, click **Service Principal**.
12. In the **Tenant** box, ensure that the value matches the **Directory ID** that you saved in **Auth\_details.txt**.
13. In the **Service principal id** box, paste the **Application ID** value that you saved in **Auth\_details.txt**.
14. In the **Service principal key** box, paste the **API key** (Key1) value that you saved in **Auth\_details.txt**, and then click **Next**.
15. On the **Choose the input file or folder** page, click **Stolen**, and then click **Choose**.
16. Select the **Copy files recursively**, and **Binary copy** check boxes, and then click **Next**.
17. On the **Destination data store** page, click **Azure Data Lake Store**, and then click **Next**.
18. On the **Specify Data Lake Store connection** page, in the **Connection name** box, type **Output Data Lake Store**.
19. In the **Azure subscription** box, select your Azure Pass subscription.
20. In the **Data Lake store account name** box, click **adlsbackup&lt;_your name_&gt;&lt;_date_&gt;**.
21. In the **Authentication type** box, click **Service Principal**.
22. In the **Tenant** box, ensure that the value matches the **Directory ID** that you saved in **Auth\_details.txt**.
23. In the **Service principal id** box, paste the **Application ID** value that you saved in **Auth\_details.txt**.
24. In the **Service principal key** box, paste the **API key** (Key1) value that you saved in **Auth\_details.txt**, and then click **Next**.
25. In the **Choose the output file or folder** page, click **Browse**, click **Stolen**, click **Choose**, and then click **Next**.
26. On the **Settings** page, click **Next**.
27. On the **Summary** page, click **Next**.
28. On the **Deployment** page, note the verification steps.
29. When the deployment has completed, click **Click here to monitor copy pipeline**. There should be a Copy animation displayed in the pipeline box becuase the pipeline is active.
30. In the **ACTIVITY WINDOWS** pane, click the most recent activity (this might still be showing as **In progress**), to show more details in the right-hand **Activity Window Explorer** pane. If if you do not see any recent activities, click **Refresh**.
31. Scroll down through the details, and if the job has completed, note the data read and written, row count, copy duration, and billed duration.
32. In the **ACTIVITY WINDOWS** list, note that there is an activity for each day in the period between your specified start and end times. You will check the results of this job in a later exercise, after it has finished processing.

> **Result**: In this exercise, you:
>
> - Verified the data in the original ADLS account.
> - Created a second ADLS account to act as the backup location.
> - Created a new Data Factory.
> - Created a service principal to enable Data Lake Store authorization in a Data Factory pipeline.
> - Assigned permissions to the Service Principal to enable data copying.
> - Used the Data Factory Copy Wizard to backup data from one ADLS account to another.

## Exercise 2: Transform uploaded data by running a U-SQL script in an ADLA linked service

### Task 1: Prepare the environment

1. On the desktop, using **File Explorer**, move to the folder **E:\\Labfiles\\Lab08\\Exercise2**, and then double-click the file **CameraData.csv**
2. Review the contents of the file. It should contain a series of records containing the data captured by speed cameras.
3. Close Excel.
4. In **File Explorer**, double click the file **CameraDataProcessing.txt**.
5. Review this file in Notepad. It contains a USQL script that reads speed camera data and summarizes it, grouping the results by camera ID:

    ```SQL
    // Find the statistics for a specific camera
    @datasource =
        EXTRACT CameraID string,
            SpeedLimit int,
            RecordedSpeed int,
            VehicleRegistration string,
            DetectionDateTime DateTime
        FROM @in
        USING Extractors.Csv(skipFirstNRows:1,nullEscape:"#NULL#");

    @speedSummary =
        SELECT CameraID,
            MAX(SpeedLimit) AS SpeedLimit,
            COUNT(*) AS NumberOfObservations,
            MIN(RecordedSpeed) AS Lowest,
            MAX(RecordedSpeed) AS Highest,
            AVG(RecordedSpeed) AS Average
        FROM @datasource
        WHERE CameraID == @camera
        GROUP BY CameraID;

    // Save the results
    OUTPUT @speedSummary
    TO @out
    USING Outputters.Csv(outputHeader: true, quoting: false);
    ```

    Note that this U-SQL script uses the CSV extractor to read a datafile that is stored at @in, extract some data, and assign this extract to @datasource. The script then performs some analysis on the data from a particular camera (as specified by @camera), and assigns the results to @speedSummary. The results in @speedSummary are then written out using the CSV outputter, and saved to the @out location. The @in, @out, and @camera parameters are assigned in the pipeline, not in this script.

6. Close Notepad.
7. In the Azure portal, click **All resources**, and then click **speeddata&lt;_your name_&gt;&lt;_date_&gt;**.
8. On the **speeddata&lt;_your name_&gt;&lt;_date_&gt;** blade, under **Blob Sservice**, click **Blobs**, and then click **+ Container**.
9.  In the **New container** dialog box, in the **Name** box, type **cameratestdata**, and then click **OK**.
10. On the **speeddata&lt;_your name_&gt;&lt;_date_&gt; - Containers** blade, under **Settings**, click **Access keys**.
11. Next to **key1**, click the **Click to copy** button to copy the key to the clipboard.
12. On the Windows desktop, right-click the **Start** button, and then click **Command Prompt (Admin)**.
13. In the **User Account Control** dialog box, click **Yes**.
14. At the command prompt, type the following commands. Replace **&lt;storage account name&gt;** with **speeddata&lt;_your name_&gt;&lt;_date_&gt;**, and replace **&lt;access key&gt;** with the **Storage access key** value that you saved in the clipboard, and then press Enter:

    ```CMD
    azcopy /Source:"E:\Labfiles\Lab09\Exercise2" /Pattern:"CameraData.csv" /Dest:https://<storage account name>.blob.core.windows.net/cameratestdata /DestKey:<access key> /S

    azcopy /Source:"E:\Labfiles\Lab09\Exercise2" /Pattern:"CameraDataProcessing.txt" /Dest:https://<storage account name>.blob.core.windows.net/scripts /DestKey:<access key> /S
    ```

    You can copy these commands from the file **E:\\LabFiles\\Lab09\\Exercise2\\AZCopyCmd.txt**.

15. When the copies have completed, at the command prompt, type the following command. Replace **&lt;storage account name&gt;** with **speeddata&lt;_your name_&gt;&lt;_date_&gt;**, replace **&lt;data lake store&gt;** with **adls&lt;_your name_&gt;&lt;_date_&gt;**, and replace **&lt;access key&gt;** with the **Storage access key** value that you saved in the clipboard, and then press Enter:

    ```CMD
    adlcopy /source https://<storage account name>.blob.core.windows.net/cameratestdata/ /dest adl://<data lake store>.azuredatalakestore.net/CameraTestData/ /sourcekey <access key>
    ```

    You can copy this command from the file **E:\\LabFiles\\Lab09\\Exercise2\\AdlCopyCmd.txt**.

### Task 2: Add the Service Principal as Contributor to the ADLA account

1. Switch to the Azure portal.
2. Click **All resources**, and click **speedsdla&lt;_your name_&gt;&lt;_date_&gt;**.
3. On the **speedsdla&lt;_your name_&gt;&lt;_date_&gt;** blade, click **Access control (IAM)**.
4. On the **speedsdla&lt;_your name_&gt;&lt;_date_&gt; - Access control (IAM)** blade, click **+ Add**.
5. On the **Add permissions** blade, in the **Role** list, click **Contributor**.
6. In the **Select** box, type **ADLS**, click **ADLStoDataFactory**, and then click **Save**.

### Task 3: Create an Azure Data Lake Analytics linked service

1. In the Azure portal, click **All resources**, and then click **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;**.
2. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, in the **Actions** section, click **Author and deploy**.
3. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, click **More**, click **New compute**, and then click **Azure Data Lake Analytics**.
4. In the JSON editor, edit **accountName**, replacing the existing value with **speedsdla&lt;_your name_&gt;&lt;_date_&gt;**.
5. Delete the following lines:

    ```JSON
    "authorization": "<Authorization code is automatically retrieved after clicking 'Authorize' and completing the OAuth login>",

    "subscriptionId": "<[Optional] Data Lake Analytics account subscription ID (if different from Data Factory account)>",

    "resourceGroupName": "<[Optional] Data Lake Analytics account resource group name (if different from Data Factory account)>",

    "sessionId": "<OAuth session id from OAuth authorization session. Each session id is unique and may only be used once>"
    ```

6. Add the following lines under the **accountName**, replace **&lt;service principal id&gt;** with the **Application ID** value, replace **&lt;service principal key&gt;** with the **API key** (Key1) value, and replace **&lt;tenant id&gt;** with the **Directory ID** that you saved in **Auth\_details.txt** in the previous exercise:

    ```JSON
    "dataLakeAnalyticsUri": "azuredatalakeanalytics.net",

    "servicePrincipalId": "<service principal id>",

    "servicePrincipalKey": "<service principal key>",

    "tenant": "<tenant id>"
    ```

    You can copy this JSON text from the file **E:\\Labfiles\\Lab09\\Exercise2\\JsonCmd1.txt**.

7. Click **Deploy**.
8. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, expand **Linked services**, and then click **AzureDataLakeAnalyticsLinkedService**. Note that the key has been obfuscated with \*\*\*\*\*\*\*\*\*.

### Task 4: Create a Data Lake Store linked service for input and output datasets

1. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, click **New data store**, and then click **Azure Data Lake Store**.
2. In the JSON editor, edit the following properties:
    - **dataLakeStoreUri**: replace the existing value with **https://adls&lt;_your name_&gt;&lt;_date_&gt;.azuredatalakestore.net/webhdfs/v1** (you can copy this URI from the file **E:\\Labfiles\\Lab09\\Exercise2\\JsonCmd2.txt**)
    - **accountName**: replace the existing value with **adls&lt;_your name_&gt;&lt;_date_&gt;**
    - **servicePrincipalId**: replace the existing value with the **Application ID** value that you saved in **Auth\_details.txt**
    - **servicePrincipalKey**: replace the existing value with the **API key** (Key1) value that you saved in **Auth\_details.txt**
3. Delete the following lines:

    ```JSON
    "resourceGroupName": "<[Optional] Data Lake Store account resource group name (if different from Data Factory account)>",

    "subscriptionId": "<[Optional] Data Lake Store account subscription ID (if different from Data Factory account)>"
    ```

4. Delete the comma (,) at the end of the **tenant** line, and then click **Deploy**.

### Task 5: Create an Azure Storage Blob linked service for the U-SQL script

1. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, click **New data store**, and then click **Azure Storage**.
2. In the JSON editor, edit the **connectionString**. Replace **&lt;accountname&gt;** with **speeddata&lt;_your name_&gt;&lt;_date_&gt;**, and replace **&lt;accountkey&gt;** with the **Storage access key** value that you saved in the clipboard earlier.
3. Click **Deploy**.

### Task 6: Create Data Lake Store input and output datasets

1. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, click **More**, click **New dataset**, and then click **Azure Data Lake Store**.
2. Replace the existing JSON text with the following:

    ```JSON
    {
        "name": "Input CameraTest DataLakeStore",
        "properties": {
            "type": "AzureDataLakeStore",
            "linkedServiceName": "AzureDataLakeStoreLinkedService",
            "typeProperties": {
                "folderPath": "CameraTestData/",
                "fileName": "CameraData.csv",
                "format": {
                    "type": "TextFormat",
                    "rowDelimiter": "\r\n",
                    "columnDelimiter": ",",
                    "firstRowAsHeader": true
                }
            },
            "external": true,
            "availability": {
                "frequency": "Minute",
                "interval": 30
            },
            "policy": {
                "externalData": {
                    "retryInterval": "00:01:00",
                    "retryTimeout": "00:10:00",
                    "maximumRetry": 3
                }
            }
        }
    }
    ```

    This configuration connects to the **CameraData.csv** file in the **CameraTestData** folder in the Data Lake Store. This is the location to which you uploaded the file earlier.

    You can copy this JSON text from the file **E:\\Labfiles\\Lab09\\Exercise2\\JsonCmd3.txt**.

3. Click **Deploy**.
4. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, click **More**, click **New dataset**, and then click **Azure Data Lake Store**.
5. Replace the existing JSON text with the following:

    ```JSON
    {
        "name": "Output CameraTest DataLakeStore",
        "properties": {
            "type": "AzureDataLakeStore",
            "linkedServiceName": "AzureDataLakeStoreLinkedService",
            "typeProperties": {
                "folderPath": "CameraTestData/output/"
            },
            "external": false,
            "availability": {
                "frequency": "Minute",
                "interval": 30
            },
            "policy": {}
        }
    }
    ```

    This configuration also connects to the Azure Data Lake Store. It will be used to write data to the **CameraTestData/output** folder.

    You can copy this JSON text from the file **E:\\Labfiles\\Lab09\\Exercise2\\JsonCmd4.txt**.

6. Click **Deploy**.

### Task 7: Create and deploy a new pipeline

1. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, click **More**, then click **New pipeline**.
2. Replace the existing JSON text with the following:

    ```JSON
    {
        "name": "Speed data extract pipeline",
        "properties": {
            "description": "Pipeline to extract speed data for a specific CameraID.",
            "activities": [
                {
                    "type": "DataLakeAnalyticsU-SQL",
                    "typeProperties": {
                        "scriptPath": "scripts\\CameraDataProcessing.txt",
                        "scriptLinkedService": "AzureStorageLinkedService",
                        "degreeOfParallelism": 3,
                        "priority": 100,
                        "parameters": {
                            "in": "/CameraTestData/CameraData.csv",
                            "out": "/CameraTestData/output/SpeedSummary.csv",
                            "camera": "Camera 121"
                        }
                    },
                    "inputs": [
                        {
                            "name": "Input CameraTest DataLakeStore"
                        }
                    ],
                    "outputs": [
                        {
                            "name": "Output CameraTest DataLakeStore"
                        }
                    ],
                    "policy": {
                        "timeout": "06:00:00",
                        "concurrency": 1,
                        "executionPriorityOrder": "NewestFirst",
                        "retry": 1
                    },
                    "scheduler": {
                        "frequency": "Minute",
                        "interval": 30
                    },
                    "name": "ASA U-SQL process",
                    "linkedServiceName": "AzureDataLakeAnalyticsLinkedService"
                }
            ],
            "start": "2017-10-28T01:00:00Z",
            "end": "2017-10-30T01:00:00Z",
            "isPaused": false
        }
    }
    ```

    This pipeline runs the USQL script stored in the **CameraDataProcessing.txt** file. You reviewed this script earlier and uploaded it to blob storega. Ths script uses the datasets defined in the previous exercise as input and output locations. The USQL analysis runs every 30 minutes.

    > **IMPORTANT**: Change the value for the start property to be yesterday's date, and the value for the end property to be tomorrow's date.

    You can copy this JSON text from the file **E:\\Labfiles\\Lab09\\Exercise2\\JsonCmd5.txt**.

3. Click **Deploy**.
4. Close the JSON editor, and **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade.

### Task 8: Verify the U-SQL data transformation

1. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, in the **Actions** section, click **Diagram**. If necessary, use the mouse to rearrange the pipelines so that they do not overlap.
2. Double-click **Input CameraTest DataLakeStore**.
3. Under **Monitoring**, note the slices with a **Ready** or **In Progress** status (you might need to click **See more** to see these, depending on your current time in relation to UTC).
4. Close the **Data slices** blade (if open), and then close the **Input CameraTest DataLakeStore** blade.
5. On the **Diagram** blade, double-click **Output CameraTest DataLakeStore**.
6. Under **Monitoring**, note the slices with a **Ready** or **In Progress** status.
7. Close the **Data slices** blade (if open), and then close the **Output CameraTest DataLakeStore** blade.
8. Close the **Diagram** blade.
9. In the Azure portal, click **All resources**, click **adls&lt;_your name_&gt;&lt;_date_&gt;**, and then click **Data explorer**.
10. On the **Data explorer** blade, click the **CameraTestData** folder, and then click **output**.
11. Click **SpeedSummary.csv**. This file should contain a header row and one row of data, summarizing the captured speed statistics for camera 121 (this was the input parameter passed to the USQL script by the pipeline):

    ```Text
    CameraID,SpeedLimit,NumberOfObservations,Lowest,Highest,Average
    Camera 121,30,1009,0,21,7
    ```

12. Close the **File Preview** blade.

> **Result**: In this exercise, you:
>
> - Prepared your environment and uploaded test data to your Data Lake Store.
> - Added the Service Principal as a Contributor to the ADLA account.
> - Created an Azure Data Lake Analytics linked service.
> - Created a Data Lake Store linked service for input and output datasets.
> - Created an Azure Storage Blob linked service for the U-SQL script.
> - Created Data Lake Store input and output datasets.
> - Created and deployed a new pipeline.
> - Verified the U-SQL data transformation.

## Exercise 3: Transform uploaded data by running an ML model in a Machine Learning linked service

### Task 1: Prepare the environment

1. On the desktop, switch to the Admin command prompt.
2. At the command prompt, type the following commands. Replace **&lt;storage account name&gt;** with **speeddata&lt;your name&gt;&lt;date&gt;**, and replace **&lt;access key&gt;** with the **Storage access key** value that you stored in the clipboard earlier, and then press Enter:

    ```CMD
    azcopy /Source:"E:\Labfiles\Lab09\Exercise3" /Pattern:"LiveSpeedData.csv" /Dest:https://<storage account name>.blob.core.windows.net/capturedspeeds /DestKey:<access key> /S
    ```

    The **LiveSpeedData.csv** file contains the sample data used by the ML model.

    You can copy these commands from the file **E:\\LabFiles\\Lab09\\Exercise3\\AZCopyCmd.txt**.

3. In the Azure portal, click **All resources**, and then click **trafficwarehouse**.
4. On the **trafficwarehouse** blade, click **Resume**, and then click **Yes**.

### Task 2: Obtain the API key and batch execution URL for a deployed ML model

1. In the Azure portal, click **All resources**, and then click **Traffic**.
2. Under **Additional Links**, click **Launch Machine Learning Studio**.
3. On the **Microsoft Azure Machine Learning Studio** page, click **Sign In**.
4. In Machine Learning Studio, in the left menu, click **WEB SERVICES**, and then click the experiment that you created in Lab08, Exercise 2.
5. Copy the **API key** to the clipboard.
6. Start Notepad, type **Web service API key**, press Enter to create a new line, and then paste the API key.
7. In Azure Machine Learning Studio, click **BATCH EXECUTION**.
8. On the **Batch Execution API Documentation for Experiment** page,copy the **Request URI** to the clipboard
9. Switch to Notepad, click at the end of the file, press Enter to create a new line, then type **Request URI**, press Enter to create a new line, and then paste the Request URI.
10. Save the file in your Documents folder, as **Web\_config.txt** (overwrite any existing file with the same name).

### Task 3: Create an ML linked service

1. Switch to the Azure portal, click **All resources**, and then click **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;**.
2. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, in the **Actions** section, click **Author and deploy**.
3. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, click **More**, click **New compute**, and then click **Azure ML**.
4. In the JSON editor, edit the following properties:
    - **mlEndpoint**: replace the existing value with the **Request URI** you saved to **Config\_details.txt**.
    - **apiKey**: replace the existing value with the **Web service API key** you saved to **Config\_details.txt**.
    - Delete the three lines marked as **(Optional)**.
5. Click **Deploy**.

### Task 4: Create Azure Storage input and output datasets

1. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, click **More**, click **New dataset**, and then click **Azure Blob storage**.
2. Replace the existing JSON text with the following:

    ```JSON
    {
        "name": "Input from Azure Storage",
        "properties": {
            "type": "AzureBlob",
            "linkedServiceName": "AzureStorageLinkedService",
            "typeProperties": {
                "folderPath": "capturedspeeds/",
                "fileName": "LiveSpeedData.csv",
                "format": {
                    "type": "TextFormat",
                    "columnDelimiter": ","
                }
            },
            "external": true,
            "availability": {
                "frequency": "Minute",
                "interval": 15
            },
            "policy": {
                "externalData": {
                    "retryInterval": "00:01:00",
                    "retryTimeout": "00:10:00",
                    "maximumRetry": 3
                }
            }
        }
    }
    ```

    You can copy this JSON text from the file **E:\\Labfiles\\Lab09\\Exercise3\\JsonCmd1.txt**.

3. Click **Deploy**.
4. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, click **More**, click **New dataset**, and then click **Azure Blob storage**.
5. Replace the existing JSON text with the following:

    ```JSON
    {
        "name": "Output to Azure Storage",
        "properties": {
            "type": "AzureBlob",
            "linkedServiceName": "AzureStorageLinkedService",
            "typeProperties": {
                "folderPath": "cameralivedata/scored/{folderpart}/",
                "fileName": "{filepart}result.csv",
                "partitionedBy": [
                    {
                        "name": "folderpart",
                        "value": {
                            "type": "DateTime",
                            "date": "SliceStart",
                            "format": "yyyyMMdd"
                        }
                    },
                    {
                        "name": "filepart",
                        "value": {
                            "type": "DateTime",
                            "date": "SliceStart",
                            "format": "HHmmss"
                        }
                    }
                ],
                "format": {
                    "type": "TextFormat",
                    "columnDelimiter": ","
                }
            },
            "availability": {
                "frequency": "Minute",
                "interval": 15
            }
        }
    }
    ```

    You can copy this JSON text from the file **E:\\Labfiles\\Lab09\\Exercise3\\JsonCmd2.txt**.

6. Click **Deploy**.

### Task 5: Create and deploy a new pipeline

1. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, click **More**, then click **New pipeline**.
2. Replace the existing JSON text with the following:

    ```JSON
    {
        "name": "ML Predictive Pipeline",
        "properties": {
            "activities": [
                {
                    "name": "ML Activity",
                    "type": "AzureMLBatchExecution",
                    "inputs": [
                        {
                            "name": "Input from Azure Storage"
                        }
                    ],
                    "outputs": [
                        {
                            "name": "Output to Azure Storage"
                        }
                    ],
                    "linkedServiceName": "AzureMLLinkedService",
                    "typeProperties":
                    {
                        "webServiceInput": "Input from Azure Storage",
                        "webServiceOutputs": {
                            "output1": "Output to Azure Storage"
                        }
                    },
                    "policy": {
                        "concurrency": 3,
                        "executionPriorityOrder": "NewestFirst",
                        "retry": 1,
                        "timeout": "02:00:00"
                    }
                }
            ],
            "start": "2017-10-23T00:00:00Z",
            "end": "2017-10-24T00:00:00Z"
        }
    }
    ```

    You can copy this JSON text from the file  **E:\\Labfiles\\Lab09\\Exercise3\\JsonCmd3.txt**.

    > **IMPORTANT**: Change the value for the start property to be yesterday's date, and the value for the end property to be tomorrow's date.

3. Click **Deploy**.
4. Close the JSON editor, and **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade.

### Task 6: Verify the ML data transformation

1. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, in the **Actions** section, click **Diagram**.
2. On the **Diagram** blade, use the mouse to rearrange the three pipelines so that they do not overlap, and then double-click **Input from Azure Storage**.
3. Under **Monitoring**, note the slices with a **Ready** or **In Progress** status (you might need to click **See more** to see these, depending on your current time in relation to UTC).
4. Close the **Data slices** blade (if open), and then close the **Input from Azure Storage** blade.
5. On the **Diagram** blade, double-click **Output to Azure Storage**.
6. Under **Monitoring**, note the slices with a **Ready** or **In Progress** status.
7. Close the **Data slices** blade (if open), and then close the **Output to Azure Storage** blade.
8. Close the **Diagram** blade.
9. On the desktop, on the Windows **Start** menu, type **Microsoft Azure Storage Explorer**, and then press Enter.
10. Under your Azure Learning Pass subscription, under **Storage Accounts**, expand **speeddata&lt;_your name_&gt;&lt;_date_&gt;**, expand **Blob Containers**, and then click **cameralivedata**.
11. In the folder list, double-click **scored**, and note the dated folder (there might be more than one, depending on your time of day in relation to UTC).
12. Double-click one of the folders, and note that there are **result.csv** files for each timed slice. Note also that as the output slices are being generated every 15 minutes, although you might need to click **Refresh** to see additional files.
13. Double-click one of the **result.csv** files.
14. In the **Microsoft Azure Storage Explorer** dialog box, click **Yes**.
15. In Excel, note that the **Scored Label Mean** represents the predicted speed for that date and time, and at that camera location. In the real world, you would probably run the job every day, rather than every 15 minutes.
16. Close Excel without saving any changes.
17. Minimize Microsoft Azure Storage Explorer.
18. In the Azure Portal, click **All resources**, and then click **trafficwarehouse**.
19. On the **trafficwarehouse** blade, click **Pause**, and then click **Yes**

> **Result**: In this exercise, you:
>
> - Started your Data Warehouse.
> - Obtained the API key and batch execution URL for the deployed ML model.
> - Created an ML linked service in Data Factory.
> - Created Azure Storage input and output datasets.
> - Created and deployed a new pipeline.
> - Verified the ML data transformation.

## Exercise 4: Use the Monitoring and Management app to track progress of a pipeline

### Task 1: Use the Diagram View to see overall job statuses

1. In the Azure portal, click **All resources**, click **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;**.
2. On the **TrafficDF*&lt;your name&gt;&lt;date&gt; ***blade, in the **Actions** section, click **Monitor & Manage**.
3. In the **Diagram View** at the top of the middle pane, use your mouse wheel or the + and - controls on the lower toolbar to zoom in and out. You should see the three pipelines from the previous exercises in this lab.
4. In the **RESOURCE EXPLORER** tree view in the left pane, note the pipelines, datasets, linked services, and gateways from the previous exercises.
5. In the **ACTIVITY WINDOWS** list at the bottom of the middle pane, note that by default all activities are listed in reverse chronological order, with the most recent activity at the top of the list.
6. Click the top activity to show details in the **Activity Window Explorer** in the right pane.
7. In the **Activity Window Explorer** pane, note the calendar view, and how the 15 minute data slices are represented; if you had used daily or weekly slices, for example, the calendar display would reflect this.
8. Scroll down and look at the summary information for this activity, including start and end time, activity name, the associated pipeline and datasets, and status information.
9. Click the cog icon to see the properties of this activity, including more detailed execution data.
10. In the **Diagram** view, click **Input from Azure Storage**. The right pane displays the properties for this dataset.
11. Click the **Script** icon, to view the JSON for this dataset.
12. In the **Diagram** view, click **Output to Azure Storage**. Click the cog icon to see the properties shown for this dataset in the right pane.
13. Click the **Script** icon, to view the JSON for this dataset.
14. In the **Diagram** view, click **Traffic DF Copy Pipeline**, click the cog icon to see the start and end times for the pipeline.

### Task 2: Use filters and views to find specific status information

1. In the **ACTIVITY WINDOWS** pane, click the filter for the **Pipeline** column.
2. In the dialog box, select the **Traffic DF Copy Pipeline** check box, and then click **OK**. Filtering activities in this way helps you see which activities are used by particular pipelines.
3. Click the **Copy** icon.
4. In Notepad, press Ctrl+V; verify that you can copy detailed activity log information for use in other applications, or for reporting.
5. Click the filter for the **Status** column, and in the dialog box, select all the check boxes except for **Ready** and **None**, and then click **OK**; depending on how well your previous exercises performed, you might not actually see any activities at this point.
6. Click the **Clear all filters from the activity windows list** icon.
7. In the left-hand pane, click the **Monitoring views** icon (glasses).
8. Expand **System Views**, and click **Failed activity windows**This view provides an alternative to filtering the Activities list; again, you may not actually see any activities at this point.
9. Under **System Views**, click **In-progress activity windows**. Depending on the state of your pipelines, you might not actually see any activities at this point.

### Task 3: Lab clean up

1. In the Azure portal, click **Resource groups**.
2. Right-click **CamerasRG**, and then click **Delete resource group**.
3. In the **TYPE THE RESOURCE GROUP NAME** box, type **CamerasRG**, and then click **Delete**.
4. Close all open windows on the virtual machine, without saving if prompted.

> **Result**: In this exercise, you:
>
> - Used the Diagram View to see overall job statuses.
> - Used filters and views to find specific status information.
> - Used alerts with Data Factory pipelines.

---

©2018 Microsoft Corporation. All rights reserved.

The text in this document is available under the [Creative Commons Attribution 3.0 License](https://creativecommons.org/licenses/by/3.0/legalcode), additional terms may apply. All other content contained in this document (including, without limitation, trademarks, logos, images, etc.) are **not** included within the Creative Commons license grant. This document does not provide you with any legal rights to any intellectual property in any Microsoft product. You may copy and use this document for your internal, reference purposes.

This document is provided "as-is." Information and views expressed in this document, including URL and other Internet Web site references, may change without notice. You bear the risk of using it. Some examples are for illustration only and are fictitious. No real association is intended or inferred. Microsoft makes no warranties, express or implied, with respect to the information provided here.
