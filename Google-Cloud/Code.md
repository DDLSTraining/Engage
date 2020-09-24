# Code Examples

## BigQuery Sample Data Query

This example reports the top 10 active users in Hacker News comments:

```sql

SELECT [by],COUNT([by]) as [Count] FROM [bigquery-public-data:hacker_news.comments] GROUP BY [by] ORDER BY [Count] DESC LIMIT 10

```

This example reports the top 100 revised Wikipedia articles:

```sql

SELECT Title,id,COUNT([revision_id]) as Rev FROM [bigquery-public-data:samples.wikipedia] GROUP BY Title,id ORDER BY Rev DESC LIMIT 100

```
