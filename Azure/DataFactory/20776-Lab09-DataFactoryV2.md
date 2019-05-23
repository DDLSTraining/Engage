# Module 9: Automating Data Flow with Azure Data FactoryV2
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
     
## Lab: Automating the Data Flow with Azure Data FactoryV2

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
4. In the **Version** list, click **V2**.
5. In the **Location** list, from the list of currently available Data Factory regions, select the same location as you used for your Data Lake Stores, or if this is not available, select your nearest location.
6. Click **Create**.
7. Wait until the Data Factory has deployed before continuing with the exercise.

### Task 4: Create a Service Principal

1. In the Azure portal, click **Azure Active Directory**.
2. On the **Azure Active Directory** blade, under **Manage**, click **App registrations**, and then click **New application registration**.
3. On the **Create** blade, enter the following details, and then click **Register**:
    - **Name**: ADLStoDataFactory
    - **Supported account types**: Accounts in this organizational diractory only (Default Directory)
    - **Redirect URI**: Web and https://ADLStoDataFactory/Dummy

    Note that the actual URL entered on this blade is immaterial as you do not actually build or deploy an app at this location. It is simply acting as an identifier.

4. In the **ADLStoDataFactory** blade, next to **Application ID**, click the **Click to copy** button.
5. On the desktop, on the Windows **Start** menu, type Notepad, and then press Enter.
6. In Notepad, type **Application ID**, and then press Enter.
7. On the **Edit** menu, click **Paste**, to store the copied Application ID.
8. In Notepad, on the **File** menu, click **Save**, and save the file as **Auth\_details.txt** in your **Documents** folder.
9. Return to the Azure portal.
10. Click **Certificates & Secrets**.
11. On the **Certificates & Secrets** blade, under **Client Secrets**, click **+ New Client Secret**.
12. On the **Add a client secret** blade, enter the following information, and then click **Add**:
    - **Key description**: Key1
    - **Duration**: In 1 year
13. Copy the **VALUE** generated for **Key1** to the clipboard.
14. Switch to Notepad.
15. Press Ctrl+End, press Enter twice, type **Key1**, press Enter, and then press Ctrl+V to store the API key.
16. Return to the Azure portal.
17. Close the **ADLStoDataFactory** blade.
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
10. In the Data explorer blade, click **New Folder**.
11. In the **Create New Folder** box, type **Stolen**, and then click **OK**.
12. Click **All resources**, click **adlsbackup&lt;_your name_&gt;&lt;_date_&gt;**, and then click **Data explorer**.
13. In the Data explorer blade, click **Access**.
14. On the **Access** blade, click **+ Add**.
15. On the **Select User or Group** blade, click **ADLStoDataFactory**, and then click **Select**.
16. On the **Select Permissions** blade, select the **Read**, **Write**, and **Execute** check boxes.
17. Under **Add to**, click **This folder and all children**.
18. Under **Add as**, click **An access permission entry and a default permission entry**, and then click **Ok**.

    > **Note**: Because there is no data in this Data Lake Store, the permissions assignment process is very quick.

19. Close the **Access** blade.
20. In the Data explorer blade, click **New Folder**.
21. In the **Create New Folder** box, type **Stolen**, and then click **OK**.

### Task 6: Use Copy Wizard to back up data from ADLS1 to ADLS2

1. In the Azure portal, click **All resources**, and then click **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;**.
2. On the **Data Factory** blade, click **Author & Monitor**. This action opens a new tab in the browser.
3. On the **Overview** page, click on the **Copy Data** icon.
4. On the **Copy Data** page, in the **Properties** section, in the **Task name** box, type **Traffic DF Copy Pipeline**.
5. Under "Task Cadence or Task Schedule", click **Run once now**.
6. On the **Properties** page, click **Next**.
7. On the **Source data store** page, click **Azure**, and then click **Create new connection**.
8. On the "New Linked Service" page, select **Azure Data Lake Storage Gen 1**, and click **Continue**.
9. On the "New Linked Service" page, in the **Name** box, type **Input Data Lake Store**.
10. In the **Azure subscription** box, select your Azure Pass subscription.
11. In the **Data Lake store account name** box, click **adls&lt;_your name_&gt;&lt;_date_&gt;**.
12. In the **Authentication type** box, click **Service Principal**.
13. In the **Tenant** box, ensure that the value matches the **Directory ID** that you saved in **Auth\_details.txt**.
14. In the **Service principal id** box, paste the **Application ID** value that you saved in **Auth\_details.txt**.
15. In the **Service principal key** box, paste the **API key** (Key1) value that you saved in **Auth\_details.txt**, and then click **Next**.
16. On the "Source data store" page, click on **Next**.
17. On the **Choose the input file or folder** page, click **Browse**, click **Stolen**, and then click **Choose**.
18. Select the **Copy files recursively**, and **Binary copy** check boxes, and then click **Next**.
19. On the **Destination data store** page, , click **Azure**, and then click **Create new connection**.
20. On the "New Linked Service" page, select **Azure Data Lake Storage Gen 1**, and click **Continue**.
21. On the "New Linked Service" page, in the **Name** box, type **Output Data Lake Store**.
22. In the **Azure subscription** box, select your Azure Pass subscription.
23. On the **Specify Data Lake Store connection** page, in the **Connection name** box, type **Output Data Lake Store**.
24. In the **Azure subscription** box, select your Azure Pass subscription.
25. In the **Data Lake store account name** box, click **adlsbackup&lt;_your name_&gt;&lt;_date_&gt;**.
26. In the **Authentication type** box, click **Service Principal**.
27. In the **Tenant** box, ensure that the value matches the **Directory ID** that you saved in **Auth\_details.txt**.
28. In the **Service principal id** box, paste the **Application ID** value that you saved in **Auth\_details.txt**.
29. In the **Service principal key** box, paste the **API key** (Key1) value that you saved in **Auth\_details.txt**, and then click **Next**.
30. On the "Destination data store" page, click on **Next**.
31. In the **Choose the output file or folder** page, click **Browse**, click **Stolen**, click **Choose**, and then click **Next**.
32. On the **Settings** page, click **Next**.
33. On the **Summary** page, click **Next**.
34. On the **Deployment** page, note the verification steps.
35. When the deployment has completed, click **Monitor**.
36. In the **Pipeline Runs** pane, click the most recent activity. If if you do not see any recent activities, click **Refresh**.
37. Under "Actions" click the **Re-run** icon.
38. Click **Refresh** until the Status indicates it has stopped running.
39. Click on the "Pen" icon (Author) on the left margin.
40. Expand **Pipelines** and click on **Traffic DF Copy Pipeline**.
41. On the "Traffic DF Copy Pipeline" pane, under "Activities", expand and review each of categrories e.g.: "Move & Transform".
42. In the diagram view, click on **Copy Data**, and then review the tabs along the bottom of the screen. e.g.: "source","Sink".
43. Click on the **Code** icon on the far right of the screen, and review the JSON code for the pipeline.
44. Under "Factory Resources", expand **Datasets**, and click on "DestinationDataset_xc1". Review the tabs along the bottom of the screen. e.g.:"Connection".
45. Below "Factory Resources", click on **Connections**. Review the "Linked Services".
46. Below "Factory Resources", click on **Triggers**.
47. Close all open tabs. e.g."Connections", "Triggers".

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
4. On the **speedsdla&lt;_your name_&gt;&lt;_date_&gt; - Access control (IAM)** blade, click **+ Add**, and select **Add role assignment**.
5. On the **Add permissions** blade, in the **Role** list, click **Contributor**.
6. In the **Select** box, type **ADLS**, click **ADLStoDataFactory**, and then click **Save**.

### Task 3: Create an Azure Data Lake Analytics linked service

1. In the Azure portal, click **All resources**, and then click **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;**.
2. On the **TrafficDF&lt;_your name_&gt;&lt;_date_&gt;** blade, in the **Actions** section, click **Author & Monitor**.
3. Click on the "Pen" icon (Author) on the left margin.
4. Click on **Connections** at the bottom of the screen.
5. On the "Connections" tab, under "Linked Services" click on **+ New**.
6. On the "New Linked Service" blade, click on **Compute**, select **Azure Data lake Analytics**, and then click **Continue**.
7. In the "Name" box type **AzureDataLakeAnalyticsLinkedService**.
7. In the "Data lake Analytics account name" box select **speedsdla&lt;_your name_&gt;&lt;_date_&gt;**
8. In the "Service principal ID box, paste the **Application ID** value that you saved in **Auth\_details.txt** in the previous exercise.
9. In the "Service principal key" box, paste the **API key** (Key1) value that you saved in **Auth\_details.txt** in the previous exercise.
10. Click on **Test Connection**.
11. Click on **Finish**.
12. On the **Connecitons** blade, under **Linked services**, on the **AzureDataLakeAnalyticsLinkedService** line, click on the **Code** icon to display the JSON. Note that the credential has been encrypted.
13. Click **Finish**

### Task 4: Create an Azure Storage Blob linked service for the U-SQL script

1. On the **Connections** blade, under "Linked Services" click **+ New**.
2. Onthe "New Linked Service" blade, under "Data Store", click **Azure**, select **Azure Blob Storage**, and then click **Continue**.
3. Select your subscription and then select the storage account named **speeddata&lt;_your name_&gt;&lt;_date_&gt;**.
4. Click on **Test Connection**.
5. Click on **Finish**.

### Task 5: Create Data Lake Store input and output datasets

1. Under "Factory Resources", next to **Datasets**, click the "..." and select **Add dataset**.
2. On the "New Dataset" blade, select **Azure**,and then click **Azure Data Lake Store Gen1**. Click **Continue**.
3. On the "Select Format" blade, choose **DelimitedText**. Click **Continue**.
4. On the "Set Properties" blade, in the "Linked service box, select **InputDataLakeStore**.
5. Click the **Browse** button, in the folder list double-click **cameratestdata**, select **CameraData.csv**, and click **Finish**.
6. Select **First row as header**.
7. Click **Continue**.
8. At the top of the screen click **Publish All (1)**.
This configuration connects to the **CameraData.csv** file in the **CameraTestData** folder in the Data Lake Store. This is the location to which you uploaded the file earlier.

9.  Under "Factory Resources", next to **Datasets**, click the "..." and select **Add dataset**.
10. On the "New Dataset" blade, select **Azure**,and then click **Azure Data Lake Store Gen1**. Click **Continue**.
11. On the "Select Format" blade, choose **DelimitedText**. Click **Continue**.
12. On the "AzureDataLakeStoreFile1" blade, click **Connection**.
12. In the "Linked service box, select **InputDataLakeStore**.
13. Click the **Browse** button, in the folder list double-click **cameratestdata**, and click **Finish**.
14. Click **Test Connection**.
15. At the top of the screen click **Publish All (1)**.

This configuration also connects to the Azure Data Lake Store. It will be used to write data to the **CameraTestData/output** folder.

### Task 6: Create and deploy a new pipeline

1. Under "Factory Resources", next to **Pipelines**, click the "..." and select **Add Pipeline**.
2. On the "pipline1" blade, in the "Name" box type "Speed data extract pipeline".
3. Under "Activities", expand "Data lake Analytics", then drag **U-SQL** on to the diagram pane.
4. Below the diagram, select **ADLA Account**. In the ADLA linked service box, select **AzureDataLakeAnalytics1**.
5. Below the diagram, select **Script**. In the "Script linked service", select **AzureBlobStorage1**.
6. Click the **Browse storage** button. Inthe "Choose a file or folder" blade, double click on **Scripts**, select **CameraDataProcessing.txt**, and click **Finish**.
7. At the bottom, expand **Advanced**.
8. Below **Parameters**, click **+ New**.
9. In the "Name" box type **in**. In the "Value" box type **/CameraTestData/CameraData.csv**.
10. Click **+ New** again.
11. In the "Name" box type **out**. In the "Value" box type **/CameraTestData/SpeedSummary.csv**.
12. Click **+ New** again.
13. In the "Name" box type **camera**. In the "Value" box type **Camera 121**.
14. At the top of the screen click **Publish All (1)**.

This pipeline runs the USQL script stored in the **CameraDataProcessing.txt** file. You reviewed this script earlier and uploaded it to blob storega. Ths script uses the datasets defined in the previous exercise as input and output locations. The USQL analysis runs every 30 minutes.

15. On the "Speed data extract pipeline" blade, click on **Add trigger**, and then click **Trigger Now**, and then **Finish**.
16. Click on **Monitoring**, and then select **Pipeline Runs**. Verify the pipeling finishes with a Status of "Succeeded".

### Task 7: Verify the U-SQL data transformation

1. In the Azure portal, click **All resources**, click **adls&lt;_your name_&gt;&lt;_date_&gt;**, and then click **Data explorer**.
2. On the **Data explorer** blade, click the **CameraTestData** folder, and then click **output**.
3. Click **SpeedSummary.csv**. This file should contain a header row and one row of data, summarizing the captured speed statistics for camera 121 (this was the input parameter passed to the USQL script by the pipeline):

    ```Text
    CameraID,SpeedLimit,NumberOfObservations,Lowest,Highest,Average
    Camera 121,30,1009,0,21,7
    ```

4. Close the **File Preview** blade.

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

