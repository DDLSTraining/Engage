# Kusto Query Language
**Kusto Query Language or KQL** is the language used to query the Azure log databases, Azure Monitor Logs, Azure Monitor Application Insights and others.

**Kusto** was the original codename for the Azure Application Insights platform that Azure Monitor is now based on. 

It’s named after **Jacques Cousteau** – a French undersea explorer

**KQL** is related to **SQL** and the languages look similar.

**Structured Query Language** and is used to query traditional relational databases like Microsoft SQL Server.

So if you know what this line of **SQL** does:

		SELECT * FROM Training_Providers WHERE Provider = 'DDLS’
    
you should find **KQL** pretty easy to pick up.

The same **SQ**L query in **KQL** would look like this:
    
    Training_Providers
    | where Provider == 'DDLS’
    
The ‘|’ character (called a pipe) is very similar to the same thing in PowerShell in that it passes (or ‘pipes’) the data through into the next command.

So the query above takes all the rows in Training_Providers and pipes them through to the where statement, which filters to the rows where Provider is ‘DDLS’.

You can chain multiple statements together by piping the data through to further statements:
Training_Providers
| where Providers == ‘DDLS’
| order by Course_title
Notice that equality operators use double ==
Case-insensitive comparisons on strings use =~
		Providers =~ 'DDLS’
And string contains (case-insensitive) can be done with contains:
		Provider contains 'DDLS’
With DateTimes you can refer to d, h, m, and s for days, hours, minutes and seconds such as
		starttime > now(-7d)
If you’re familiar with SQL or PowerShell, there are other similarities.
The keyword count gives you the count of rows. It’s like SUM in SQL and measure.Count() in PowerShell.
Thus pipe your data into the count statement would be this in SQL:
		SELECT SUM(*) FROM TrainingProviders
And this PowerShell:
		Get-TrainingProviders | measure
But is this in KQL:
		TrainingProviders
		| count
The keyword project is like SELECT in SQL and select in PowerShell. 
It allows you to pick the columns (or properties) you’re interested in, you pipe the data into the project statement to select the columns.
So this SQL:
			SELECT Course_title, level FROM TrainingProviders
And this PowerShell:
			Get-TrainingProviders | select Course_title, level
Becomes this KQL:
			TrainingProviders
			| project Course_title, level
If you need to calculate new columns based on other values, use extend. It adds new columns to your existing data.
TrainingProviders
| extend duration_hours = duration / 60.0
| project Course_title, level, duration_hours

Remember: project is like SELECT in SQL and select in PowerShell, it allows you to pick the columns (or properties).
The KQL keyword sort by is like ORDER BY in SQL and sort in PowerShell:
			TrainingProviders
			| sort by Provider
To truncate your results, the keyword is take and similar to TOP in SQL and select-first in PowerShell:

			TrainingProviders
			| take 10
So you can then combine sort by and take to give you the top N results. 
			TrainingProviders
			| top 10 by Provider
The KQL keyword sort by is like ORDER BY in SQL and sort in PowerShell:
			TrainingProviders 
			| sort by Provider
To truncate your results, the keyword is take and similar to TOP in SQL and select-first in PowerShell:
			TrainingProviders
			| take 10
So you can then combine sort by and take to give you the top N results. 
			TrainingProviders
			| top 10 by Provider
Note: KQL commands have aliases For example, the keywords top and limit do the same thing.

To perform a basic join it’s very similar to SQL:
			TrainingProviders
			| join CourseStats on Courseid
May be we practice now?
https://dataexplorer.azure.com/clusters/help/databases/Samples
Then try something like:
			StormEvents
			| sort by StartTime
