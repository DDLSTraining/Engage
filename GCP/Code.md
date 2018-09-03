# Code Examples

BigQuery Sample Data Query

```sql
SELECT [by],COUNT([by]) as [Count] FROM [bigquery-public-data:hacker_news.comments] GROUP BY [by] ORDER BY [Count] DESC LIMIT 10
```
