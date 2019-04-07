# 20778 DDLS Lab Instructions

## Prepare the Lab Environment

1.  If you do not have a Power BI login, open Internet Explorer, browse
    to
    [**https://powerbi.microsoft.com/en-us/documentation/powerbi-admin-signing-up-for-power-bi-with-a-new-office-365-trial**](https://powerbi.microsoft.com/en-us/documentation/powerbi-admin-signing-up-for-power-bi-with-a-new-office-365-trial),
    and then follow the steps to create an account.

2.  In Internet Explorer, browse to
    [**https://www.microsoft.com/en-us/download/details.aspx?id=45331**](https://www.microsoft.com/en-us/download/details.aspx?id=45331),
    and then click **Download**.

3.  On the **Choose the download you want** page, select the
    **PBIDesktop\_x64.msi** check box, and then click **Next**.

4.  In the message box, click **Run**.

5.  In the **Microsoft Power BI Desktop (x64) Setup** dialog box, on the
    **Welcome to the** **Microsoft Power BI Desktop (x64) Setup Wizard**
    page, click **Next**.

6.  On the **Microsoft Software License Terms** page, select the **I
    accept the terms in the License Agreement** check box, and then
    click **Next**.

7.  On the **Destination Folder** page, click **Next**.

8.  On the **Ready to install Microsoft Power BI Desktop (x64)** page,
    click **Install**.

9.  In the **User Account Control** dialog box, click **Yes**.

10. On the **Completed the Microsoft Power BI Desktop (x64) Setup
    Wizard** page, clear the **Launch Microsoft Power BI Desktop** check
    box, and then click **Finish**.

11. Close Internet Explorer.

12. Copy the **Competitors.xlsx** file from the I: drive to the
    **D:\\Student** folder.

## Module 3

### Lab: Importing Data into Power BI Desktop

Scenario

To begin the process of analyzing the Adventure Works data, all the
appropriate data will be imported from various sources. The
AdventureWorksDW SQL Server database has all the company’s sales data,
the excel file has data on competitor’s sales, and the website has
information about the estimated number of bikes owned in each country.

### Exercise 1: Importing Data into Power BI

**Task 1: Importing Data from SQL Server**

1.  On the desktop, double-click **Power BI Desktop**.

2.  When the Get Data screen shows, click **Get Data**.

3.  In the **Get Data** dialog box, click Azure, then click Azure **SQL
    Database**, and then click **Connect**.

4.  In the **SQL Server Database** dialog box, in the **Server** box,    type **ddlsrb.database.windows.net**.

5.  In the **Database (optional)** box, type **AdventureWorksDW**, and
    then click **OK**.

6.  If the **Access a SQL Server Database** dialog box appears, change
    it from Windows to Database, and enter the User name of **Student**
    and Password of **Pa$$w0rd**, and then click **Connect**.

7.  If the **Encryption Support** dialog box appears, click **OK**.

8.  In the **Navigator** dialog box, select the **FactInternetSales**
    check box, click **Select Related Tables**.

9.  Deselect DimCurrency, DimPromotion, and FactInternetSalesReason.

10. Select DimGeography, DimProductSubcategory and DimProductCategory.

11. Click **Load**.

12. On the **File** menu, click **Save** As.

13. In the **Save As** dialog box, navigate to **D:\\Student** folder,
    in the **File name** box, type **Adventure Works Sales**, and the
    click **Save**.

14. Leave Power BI Desktop open for the next task.

**Task 2: Import Data from Excel**

1.  Launch Excel and open the file **D:\\Student\\Competitors.xlsx**

2.  Note the workbook has two worksheets, each containing a matrix of
    sales information for several competitors to AdventureWorks cycles.
    We will just import the data at this stage, but we will reformat the
    data into something usable later on.

3.  In Power BI Desktop click Get Data and select Excel

4.  Browse to **D:\\Student** and open **Competitors.xlsx**

5.  In the Navigator window select Page1 and Page2, and click Load.

6.  On the **File** menu, click **Save**.

7.  Leave Power BI Desktop open for the next task.

**Task 3: Import Data from the Web**

1.  Launch a web browser and go to
    [www.worldometers.info/bicycles/](http://www.worldometers.info/bicycles/).

2.  Note the page has information about global bicycle production and
    quantity. We will be importing the data from the table under “How
    many bicycles are there in the world?”

3.  In Power BI Desktop click Get Data and select Other, and then Web.

4.  In the From Web window enter the URL
    [www.worldometers.info/bicycles/](http://www.worldometers.info/bicycles/)

5.  In the Navigator window select Table 0 and click Load.

6.  On the **File** menu, click **Save**.

7.  Leave Power BI Desktop open for the next Lab.

## Module 4

### Lab: Editing Queries in Power BI Desktop

Scenario

Now that the data has been imported it is apparent that some
modifications to the queries are required. There are many unnecessary
columns, the names of many of the tables and columns are not intuitive,
even the format of some the data will make it hard to analyze.

### Exercise 1: Shaping the data into Power BI

**Task 1: Editing Data Queries from SQL Server**

1.  In Power BI Desktop, in the Home ribbon, click Edit Queries.

2.  In the Query editor window, in the Queries pane (on the left),
    select FactInternetSales.

3.  In the Query Settings pane (on the right), change the Name to
    InternetSales.

4.  In the middle pane, select the columns PromotionKey, RevisionNumber,
    UnitPriceDiscountPct, DiscountAmount, CarrierTrackingNumber,
    CustomerPONumber, and then in the ribbon click Remove Columns.

5.  In the Queries pane select DimCustomer and rename this to Customer.

6.  Remove the columns Title, NameStyle, Suffix, SpanishEducation,
    FrenchEducation, SpanishOccupation, and FrenchOccupation.

7.  Right click the EnglishEducation column and select Rename…

8.  Remove the word “English” from the name.

9.  Rename the EnglishOccupation column to Occupation.

10. Select the Gender column, and in the ribbon click Replace Values.

11. In the “Value To” Find box type M.

12. In the Replace With box type Male, then click OK.

13. Right-click the Gender column and choose Replace Values…

14. Replace the value F with Female.

15. Replace the values in the MaritalStatus column so the S becomes
    Single and M becomes Married.

16. In the Queries pane select DimDate.

17. Rename it to Date.

18. Remove the Spanish and French columns.

19. Right-click the column EnglishDayNameOfWeek and select Rename…

20. Remove the word English.

21. Rename the column EnglishMonthName to just MonthName.

22. Right-click the column DayNumberOfWeek and select Remove.

23. In the Applied Steps pane, click the X next to the last step
    (Removed Columns1) to undo it.

24. Rename the queries that begin with “Dim” by removing the prefix
    “Dim”.

25. From the queries now named Geography, Product, ProductSubcategory,
    and ProductCategory also remove the Spanish and French columns, and
    remove the word English from any remaining column.

26. In the Queries pane select Product.

27. Remove the Description columns.

28. On the **File** menu, click **Save**. When prompted, click Apply.

29. Leave Power BI Desktop and Power Query Editor open for the next
    task.

**Task 2: Editing Data Queries from Excel**

1.  In the Queries pane select Page1.

2.  In the Applied Steps pane, delete the rows “Promoted Headers” and
    “Changed Type”.

3.  In the ribbon select the Transform tab, and then click Transpose.

4.  Click Use First Row As Headers.

5.  On the column header 2010, click the down arrow and select Remove
    Empty.

6.  Rename Column1 to Competitor.

7.  Rename Column2 to Category.

8.  Select the columns 2007, 2008, 2009, and 2010, and then in the
    ribbon click Unpivot Columns.

9.  Rename the Attribute column to Year, and the Value column to
    SalesAmount.

10. Right-click the Competitor column and select Fill and then Down.

11. In the Queries pane select Page2 and repeat steps 2 to 9 for this
    query, or copy the code and paste the code in the Advanced Editor
    window.

12. In the ribbon, select the Home tab, and then click Append Queries As
    New.

13. In the Append windows, set the Primary table to be Page1, and the
    Table to append… to be Page2.

14. In the Queries pane, rename the query Append1 to CompetitorSales.

15. In the Queries pane select Page1.

16. In the ribbon click Properties.

17. In the Query Properties window, deselect “Enable load to report” and
    click OK.

18. Repeat steps 15 and 16 for the query Page2.

19. On the File menu, click Save. When prompted, click Apply.

20. Leave Power BI Desktop open for the next task.

**Task 3: Editing Data Queries from the Web**

1.  In the Queries pane select Table 0.

2.  On the Country column click the down arrow.

3.  Only select the countries Australia, Canada, France, Germany, UK,
    and USA.

4.  Replace the values UK and USA with United Kingdom and United States
    respectively.

5.  Remove the Year column.

6.  Rename the query to BikeNumbersByCountry.

7.  In the ribbon click Close & Apply to close the Query Editor window.

8.  On the File menu click Save.

9.  Leave Power BI Desktop open for the next Lab.

## Module 5

### Lab: Modelling Data in Power BI Desktop

Scenario

Now that the data has been imported, some relationships need to be added
to allow the analysis to occur across all the different sources. Some of
the fields need to be modified so that Power BI can display them
correctly on reports. Creating some hierarchies will be useful later
when visualizations are added to the reports. Additionally, some missing
values required will need to be calculated from the data that has been
imported.

### Exercise 1: Modelling Data in Power BI

**Task 1: Modifying Field Properties in Power BI**

1.  In Power BI Desktop click on the Data icon on the left hand side.

2.  In the Fields pane on the right hand side, expand the
    BikeNumbersByCountry table.

3.  Click on the Quantity column.

4.  In the ribbon click on the Modeling tab.

5.  Note the Quantity column has a Data Type of Decimal Number. Change
    it to Whole Number.

6.  Note the Format is General. Change it to Whole Number.

7.  Make sure the Default Summarization is Sum. In the Fields pane note
    that a Sigma symbol appears next to the Quantity field.

8.  Click on the Country column.

9.  In the ribbon, change the Data Category from Uncategorized to
    Country/Region. In the Fields pane note that a Globe symbol appears
    next to the Country field.

10. In the Fields pane expand Geography.

11. Change the Data Category appropriately for the following fields:
    City, CountryRegionName, PostalCode, StateProvinceName.

12. On the **File** menu, click **Save**.

13. Leave Power BI Desktop open for the next Task.

**Task 2: Adding Hierarchies**

1.  In the Fields pane, in the Geography table, select the
    CountryRegionName column.

2.  Either right-click this column, or click the … , and then select New
    hierarchy.

3.  Drag the StateProvinceName column and drop it on “CountryRegionName
    Hierarchy”.

4.  Drag the City column and drop it on CountryRegionName Hierarchy.

5.  Right click “CountryRegionName Hierarchy” and select Rename. Change
    its name to Location.

6.  Repeat the above steps to create two hierarchies in the Date table,
    one for CalendarYear, CalendarQuarter and MonthName, and one for
    FiscalYear, FiscalQuarter and MonthName. Name them CalendarDates and
    FiscalDates.

**Task 3: Adding Calculated Columns**

1.  In the Fields pane expand Customer.

2.  In the ribbon, on the Modeling tab, click New Column.

3.  In the formula bar, highlight **Column =**, type the following code,
    and then press Enter:

> IncomeStatus = IF (Customer\[YearlyIncome\] &lt; 25000, "Lower
> Income",
>
> IF (AND(Customer\[YearlyIncome\] &gt;= 25000, Customer\[YearlyIncome\]
> &lt; 60000), "Middle Income",
>
> IF (AND(Customer\[YearlyIncome\] &gt;= 60000, Customer\[YearlyIncome\]
> &lt; 100000), "Higher Income",
>
> IF (Customer\[YearlyIncome\] &gt;= 100000, "Very High Income",
> "Other"))))

1.  In the ribbon, on the Modeling tab, click New Column.

2.  In the formula bar, highlight Column =, type the following code, and
    then press Enter:

> DaysSinceFirstPurchase = DATEDIFF(Customer\[DateFirstPurchase\],TODAY(), DAY)

1.  Click **New Column**.

2.  In the formula bar, highlight **Column =**, type the following code,
    and then press Enter:

> FullName = \[FirstName\] & " " & \[LastName\]

1.  In the Fields pane expand InternetSales.

2.  Click New Column.

3.  In the formula bar, highlight **Column =**, type the following code,
    and then press Enter:

> SalesProfit = CURRENCY(InternetSales\[SalesAmount\] -
> InternetSales\[TotalProductCost\])

1.  On the file menu click Save.

2.  Leave Power Bi Desktop open for the next Task.

**Task 4: Adding Measures.**

1.  In the fields expand InternetSales.

2.  In the ribbon on the Modeling tab, click New Measure.

3.  In the formula bar, highlight **Measure =**, type the following
    code, and then press Enter:

> InternetRevenue = SUM(\[SalesAmount\])

1.  In the Fields pane select InternetRevenue. In the Modeling tab
    change the Format to Currency $ English.

2.  In the ribbon on the Modeling tab, click New Measure.

3.  In the formula bar, highlight **Measure =**, type the following
    code, and then press Enter:

> InternetProfit = SUM(\[SalesProfit\])

1.  In the Fields pane select InternetProfit. In the Modeling tab change
    the Format to Currency $ English.

2.  In the ribbon on the Modeling tab, click New Measure.

3.  In the formula bar, highlight **Measure =**, type the following
    code, and then press Enter:

> InternetMargin = \[InternetProfit\] / \[InternetRevenue\]

1.  In the Fields pane select InternetMargin. In the Modeling tab change
    the Format to Percentage.

2.  In the ribbon on the Modeling tab, click New Measure.

3.  In the formula bar, highlight **Measure =**, type the following
    code, and then press Enter:

> InternetTargetMargin = (SUM('Product'\[ListPrice\]) -
> SUM('Product'\[StandardCost\])) / SUM('Product'\[ListPrice\])

1.  In the Fields pane select InternetTargetMargin. In the Modeling tab
    change the Format to Percentage.

2.  On the file menu click Save.

3.  Leave Power Bi Desktop open for the next Task.

**Task 5: Creating and Modifying Relationships.**

1.  In Power BI Desktop click on the Relationships icon on the left hand
    side.

2.  Create a relationship to the BikeNumbersByCountry table by dragging
    the Country column and dropping it on the CountryRegionName column
    in the Geography table. (You might have to scroll across to the
    right to see the table).

3.  Create a relationship to the CompetitorSales table by dragging the
    Category column and dropping it on the ProductCategoryName column in
    the ProductCategory table.

4.  Then drag the Year column and drop it on the CalendarYear column of
    the Date table. Note the error that appears because neither column
    has unique values.

5.  On the file menu click Save.

6.  Leave Power Bi Desktop open for the next Task.

**Task 6: Adding a Calculated Table.**

1.  Click on the Data icon on the left hand side.

2.  In the ribbon, on the Modeling tab, click New Table.

3.  In the formula bar, highlight **Table =**, type the following code,
    > and then press Enter:

> Years = DISTINCT('Date'\[CalendarYear\])

1.  Click on the Relationships icon.

2.  Drag the Years column from the CompetitorSales table to the
    > CalendarYear column of the Years table.

3.  Drag the CalendarYear column from the Date table to the CalendarYear
    > column of the Years table.

4.  On the file menu click Save.

5.  Leave Power Bi Desktop open for the next Lab.

## Module 6

### Lab: Visualizations in Power BI Desktop

Scenario

Now that the data has been imported, shaped and modelled, it’s time to
do some analysis by adding visualizations to a report. Report pages need
to be added for Internet Sales and Reseller Sales. Some custom
visualizations will also be added to provide additional functionality.

### Exercise 1: Using Visualizations in Power BI

**Task 1: Using the Column visualization in Power BI**

1.  In Power BI click on the Report icon on the left hand side.

2.  In the Fields pane on the right hand side, expand InternetSales.

3.  Select SalesAmount. This will add a new column chart visualization
    to the report page.

4.  In the Fields pane expand Date, and select the FiscalDates
    hierarchy. This will add more columns to the chart.

5.  Resize the chart so that all the Year names are visible.

6.  With the chart still selected, in the Visualizations pane select
    Clustered bar chart.

7.  Change it back to Clustered column chart.

8.  Resize the chart so that it fills the top left corner of the report.

9.  In the Visualizations pane, click the Format icon (looks like a
    paint roller).

10. Expand Title and change the Title Text to Internet Sales by Date.

11. Change the title to center alignment, and the color black and the
    size 10.

12. On the **File** menu, click **Save**.

13. Leave Power BI Desktop open for the next Task.

**Task 2: Using Drill Down functionality in Power BI.**

1.  With the column chart still selected, click the double down arrow
    symbol to drill down to the FiscalQuarter level.

2.  Click the up arrow to go back up to the FiscalYear level.

3.  Click the expand all button (looks like an upside down U).

4.  Click the up arrow to go back to the FiscalYear level.

5.  Click on the column for 2008. This just highlights the column.

6.  In the chart, click on the single down arrow symbol to turn on Drill
    Down.

7.  Click on the column for 2008. This now drills down to show the data
    for that year only.

8.  Click on the up arrow to go back to the FiscalYear level.

9.  Click on the single down arrow symbol to turn off Drill Down.

10. On the file menu click Save.

11. Leave Power Bi Desktop open for the next Task.

**Task 3: Using the Map visualization in Power BI.**

1.  In the report page click a blank area.

2.  In the Fields pane select the Location Hierarchy from the Geography
    table, and SalesAmount from the InternetSales table.

3.  Resize the Map chart so the fills the top right corner of the
    report.

4.  Drag the FiscalYear column from the Date table to the Legend field
    in the Visualization pane.

5.  In one of the column charts, click on a year column. Click on the
    year column again.

6.  Click on the Map visualization.

7.  Remove FiscalYear from the Legend field.

8.  Hover the cursor over one of the bubbles and view the pop-up.

9.  Drag the OrderQuantity column from the InternetSales table to the
    Tooltips field in the Visualizations pane.

10. Hover the cursor over one of the bubbles and view the pop-up again.

11. Change the chart title to Internet Sales by Geography, center
    aligned, black, size 10.

12. At the bottom of the screen, right click “Page 1” and select “Rename
    Page”. Name the page “Internet Sales”.

13. On the file menu click Save.

14. Leave Power Bi Desktop open for the next Task.

**Task 4: Using the Treemap visualization in Power BI.**

1.  In the report page click a blank area.

2.  In the Fields pane select ProductCategoryName from the
    ProductCategory table, and InternetProfit from the InternetSales
    table.

3.  In the Visualizations pane select Treemap.

4.  Resize the Treemap chart to fill the bottom left corner of the
    report.

5.  Drag the FiscalYear column from the Date table to the Group field in
    the Visualization pane.

6.  In the treemap chart experiment with the Drill Down settings used in
    Task 2.

7.  In the Visualizations pane drag ProductCategoryName from the Group
    field to the Details field.

8.  On the file menu click Save.

9.  Leave Power Bi Desktop open for the next Task.

**Task 5: Using the Scatter visualization in Power BI.**

1.  In the report page click a blank area.

2.  In the Fields pane select SalesAmount from the InternetSales table.

3.  In the Visualizations pane select Scatter chart.

4.  Resize the Scatter chart to fill the bottom right corner of the
    report.

5.  Drag the OrderQuantity column from the InternetSales table to the Y
    Axis field in the Visualizations pane.

6.  Drag the Location hierarchy from the Geography table to the Details
    field.

7.  If you get an error, in the Vizualization pane, click the down arrow
    next to OrderQuantity and select “Sum”.

8.  Drag the FiscalYear column from the Date table to the Legend field.

9.  Hover the cursor over one the circles in the scatter chart.

10. In the column chart, click on a year column. Click on the year
    column again.

11. Click on the scatter chart.

12. Drag the InternetMargin column from the InternetSales table to the
    Size field.

13. Hover the cursor over one the circles in the scatter chart.

14. In the scatter chart experiment with the Drill Down settings.

15. Drag FiscalYear from the Legend field to the Play Axis field.

16. In the scatter chart, click on the Play button.

17. Click on the Play button again and this time pause when the pointer
    gets to 2008.

18. While paused, click on one of the circles in the chart.

19. Click the Play button to let the animation complete.

20. Drag FiscalYear back to the legend field from the Play Axis field.

21. On the file menu click Save.

22. Leave Power Bi Desktop open for the next Task.

**Task 6: Using the Gauge visualization in Power BI.**

1.  On the Report page, resize the Treemap and Scatter charts to make
    some room to the right.

2.  In the Fields pane select InternetMargin from the InternetSales
    table.

3.  In the Visualizations pane, select Gauge.

4.  In the Fields pane, drag InternetTargetMargin to the Target value
    field.

5.  In the Visualization pane click on the Format icon (paint roller).

6.  Expand Gauge axis, and make Min equal 0 and Max equal 0.45.

7.  Test the Gauge by clicking on the other charts.

8.  On the file menu click Save.

9.  Leave Power Bi Desktop open for the next Exercise.

**Task 7: Using the KPI visualization in Power BI.**

1.  On the Report page, resize the Column and Map charts to make some
    room to the right.

2.  Click on a blank area of the report.

3.  In the Fields pane select InternetMargin from the InternetSales
    table.

4.  In the Visualizations pane, select KPI.

5.  In the Fields pane, drag InternetTargetMargin to the Target goals
    field.

6.  In the Fields pane, drag FiscalYear from the Date table to the Trend
    axis field.

7.  In the Visualization pane click on the Format icon (paint roller).

8.  Turn the Trend Axis off.

9.  Test the KPI by clicking on the other charts.

10. On the file menu click Save.

11. Leave Power Bi Desktop open for the next Exercise.

**Task 8: Creating a New Report Page in Power BI.**

1.  At the bottom of the Internet Sales page, click on the + symbol to
    create a new page.

2.  Rename the page as This Year’s Sales.

3.  Go back to the Internet Sales page, select all the visualizations
    (Ctrl-A) and copy them to the clipboard (Ctrl-C).

4.  Paste them on to the new page.

5.  Drag FiscalYear from the Date table to the “Page level filters”
    area.

6.  Only select the year 2009.

7.  On the file menu click Save.

8.  Leave Power Bi Desktop open for the next Exercise.

### Exercise 2: Importing Custom Visualizations in Power BI

**Task 1: Downloading custom visualizations**

1.  Launch Chrome or Firefox, and go to the address
    <https://store.office.com>

2.  On the left hand side of the page, under Add-Ins, click on Power BI
    Visuals.

3.  Scroll down to find and click on the Histogram Chart.

4.  On the Histogram Chart page click on the “Get It Now” button (you
    may have to sign in).

5.  On the download page click on the button “Download for Power BI”.

**Task 2: Importing custom visualizations**

1.  Go back to Power BI Desktop.

2.  On the Report page, at the bottom click on the + sign to add another
    page to the report.

3.  Rename to page to Customer Yearly Incomes.

4.  In the Visualization pane, click on the … at the bottom of the
    visualizations, and select “Import from file”.

5.  Click the Import button, and browse to Downloads folder and select
    the Histogram visual that was saved in the previous task.

6.  Click Open, and then click OK when prompted.

7.  Click on the Histogram chart to add it to the report page.

8.  From the Fields pane, drag YearlyIncome from the Customer table to
    the Values field.

9.  Then drag CustomerKey from the Customer table to the Frequency
    field.

10. In the Visualization pane, click on Format.

11. Expand General, and change the Bins value to 17.

12. In the ribbon on the Data / Drill tab, click See Data.

13. Click See Data again to return to the report.

14. Click on the … in the top right corner of the Histogram chart, and
    select Export data.

15. Save the CSV file to the D:\\**Student** folder.

16. Navigate to the file and open it to view the results.

17. Add another Histogram chart that shows Average of SalesAmount by
    YearlyIncome (copy and paste the Histogram chart and change the
    Frequency field to SalesAmount from the InternetSales table).

18. Add another page to the report.

19. Rename the page to Sales by Time.

20. Create a stacked column chart that shows SalesAmount by
    CountryRegionName.

21. Resize the column chart so that it takes up the lower half of the
    page.

22. Click a blank area of the page and add a Slicer visualization.

23. Drag FullDateAlternateKey from the Date table to the Field area.

24. Resize the Slicer so that it occupies the upper half of the report.

25. Use the Slicer to adjust which date period is included in this
    report page.

26. Add another page to the report.

27. Rename the page to Sharks.

28. In the Visualizations pane click on the … and select “Import from
    marketplace” (you might need to sign in).

29. In the Power BI Visuals page, in the Search box, type “Aquarium”.

30. Next to “Enlighten Aquarium” click the “Add” button”.

31. Click on OK when it has imported the visual.

32. Add the Aquarium visual to the report.

33. Drag SalesAmount from the InternetSales table to the visual.

34. Drag CountryRegionName from the Geography table to the Fish field.

35. Resize the visual so it takes up most of the page.

36. Click on the Format icon (paint roller).

37. Under Series, change “Series 1” to “Sharks”.

38. Change the Title to “Sharks”.

39. On the file menu click Save.

40. Leave Power Bi Desktop open for the next Exercise.

### Exercise 3: Publishing to the Power BI Service

**Task 1: Publishing to the Power BI Service.**

1.  In Power BI Desktop, in the top right corner click Sign In.

2.  When prompted provide your login name and password.

3.  In the ribbon on the Home tab, click Publish.

4.  In the Publish to Power BI window, choose My workspace as the
    destination, and click the Select button.

5.  When it has successfully published the data, click Got It.

6.  Launch Chrome or Firefox and go to the address <http://powerbi.com>

7.  Sign in to the Power BI Service using your credentials.

8.  In the Navigator pane on the left hand side, expand My Workspace.

9.  Under Reports, click on Adventure Works Sales.

10. At the bottom of the report click on each of the pages.

**Task 2: Exploring the Power BI Service.**

1.  On the Internet Sales page, click on the Gauge chart and pin it to a
    new dashboard called Sales.

2.  Under Dashboards, click on Sales.

3.  Click on the Gauge chart.

4.  Go the Sales by Time page.

5.  In the menu bar across the top, click Pin Live Page, and select the
    existing Sales dashboard.

6.  Go to the Sales dashboard.

7.  Change the Dates selected in the Slicer.

**Task 3: Editing an existing report in the Power BI Service.**

1.  Go back to the report and to the Internet Sales page.

2.  In the menu bar across the top click Edit Report.

3.  Click on the KPI chart and change the title to “Internet Sales
    Margin and Target”.

4.  Make the title black, centered and size 10.

5.  In the menu bar click Save.

6.  Go the Sales by Time page.

7.  Change the title of the Slicer to be Fiscal Dates.

8.  Make the title black, centered, and size 10.

9.  In the menu bar click Save.

10. Go the Sales dashboard.

11. Notice the title has changed for the Slicer but not the Gauge.

**Task 4: Editing a dashboard tile in the Power BI Service.**

1.  Hover over the Gauge chart and click on the …

2.  Click on the Edit Details icon (looks like a pen).

3.  In the Tile details page change the title to “Internet Sales Margin
    and Target”, and then click Apply.

4.  Hover over the Sales by Time tile and click on the …

5.  Click the Delete tile icon to remove this from the dashboard.

**Task 5: Using Q&A in the Power BI Service to create a report.**

1.  On the Sales dashboard, click at the top where it says “Ask a
    question about your data”.

2.  On the Q&A screen type “margin”.

3.  Immediately after that type “product category”.

4.  Immediately after that type “Column”.

5.  Change the word “Column” to “tree”.

6.  Change the word “tree” to “pie”.

7.  On the far right, expand Visualizations and explore the settings.

8.  Change the title to “Margin by Product Category”.

9.  Make the title black, centered, and size 10.

10. In the top right hand corner click the icon to pin this to the Sales
    dashboard.

11. Go to the Sales dashboard and move the Margin by Product Category
    tile so it is below to the Gauge tile added earlier.

12. Play.
