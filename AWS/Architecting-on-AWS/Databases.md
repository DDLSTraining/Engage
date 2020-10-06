# Database Solutions Offered by AWS

## Amazon RDS  
For when you’re looking to offload your database management workload. It’s compatible with 6 popular database engines – Amazon Aurora, MySQL, MariaDB, PostgreSQL, Oracle, and Microsoft SQL Server.
## Amazon Redshift 
Is also a managed database service and a relational database, running its own engine adapted from PostgreSQL. It can be more costly, more complex to work with and much more powerful. 
Redshift is an OLAP database, ‘online analytical processing’ suited to processing analytical queries involving more complex calculations and vast storage potential and differing functionality.
Redshift is an enterprise-level data warehouse solution, mostly used by large companies.
## DynamoDB 
Is a key-value database that runs the NoSQL engine.  This makes the data stored in DynamoDB ‘dynamic’ which means it’s easier to modify. Key-value databases are best suited to certain use cases such as session data and shopping cart information and can achieve a fast throughput of read/write requests. It’s also an enterprise-level solution.
## Amazon Aurora 
Amazon Aurora is a database engine that can be run on RDS or as Aurora Serverless. Aurora is MySQL and PostgreSQL compatible.  Further, Aurora has significantly higher performance stats compared to MySQL and PostgreSQL run on RDS.  It is designed to deliver the speed and reliability of high-end commercial databases in a simple and cost-effective manner.  It is designed to deliver the speed and reliability of high-end commercial databases in a simple and cost-effective manner.  Aurora is also an enterprise solution, even when used with RDS.
How Do They Compare?

# 1. Scaling 
## RDS
Is less complex, &  easier to scale – requiring just a few clicks on the AWS Console to determine an auto-scale max capacity. It can be run using a reserved capacity or on-demand.
## Redshift
Infrastructure is more complicated, meaning there’ll be more downtime and complexity involved in scaling. Using Elastic Resize, Redshift can be scaled more quickly, but it still doesn’t quite close the gap with RDS. At the extreme end of things, however, Redshift is probably the better choice, since its Concurrency Scaling feature – which costs extra – allows it to take on a virtually limitless amount of queries.
## DynamoDB
Scales seamlessly with no impact on performance. And the user may choose to run DynamoDB on on-demand or in provisioned capacity mode, in which a limit can be set on scale, much like RDS. 
## Aurora
How it scales depends on whether it’s running on RDS or Aurora Serverless. On RDS, it scales as described above. Aurora Serverless, however, will automatically start-up, scale-up, scale down and shut down in-line with your application’s needs. 

## Conclusion
If you have standard scaling needs, RDS is the better option. If you have enterprise needs, and the time and budget, Redshift might be preferable depending on the types of queries you’ll be running. Similarly, if you have a very high-volume of read/write requests, DynamoDB may work better. 
And if you want a more powerful relational database for non-analytical purposes, Aurora might be best, although you should consider the restrictions ‘serverless’ will impose on your work.  It depends on what you need to scale.

# 2. Storage
## RDS
Storage limit depends on which engine you’re running, but it tops out at 64 TB using Amazon Aurora. SQL accommodates 16 TB, and all the other engines allow for 32TB.
## Redshift
Max capacity is much higher at 2PB.
## DynamoDB
Has limitless storage capacity.
## Aurora
Max capacity is 64TB when run on RDS.

## Conclusion
Redshift has more storage and DynamoDB has limitless storage. 

# 3. Pricing 
## RDS
Again, RDS’s pricing is affected by the engine used, but generally it’s cost effective  than the others. RDS is available under a pay-as-you-go model, with a higher tariff, or a reserved instance model at a lower tariff and a commitment to a certain amount of usage.  This includes when running Aurora. 
## Redshift
Is also available on a reserved instance and an on-demand model, with additional features, such as Concurrency Scaling, being charged under a different scheme.
## DynamoDB
Can be charged under an on-demand or provisioned model like RDS but with some variation. Under on-demand, users will be charged per read/write and in the provisioned model, which is similar to AWS’s reserved Instances, users pay at a lower rate for an anticipated amount of read/write. 
## Aurora
Pricing falls under RDS’s when run as such. When run serverless, you’re charged by ACUs, (Aurora capacity units) which equal 2GB of memory and corresponding compute and network.

## Conclusion
Redshift is more expensive at its base rate and has additional pricing models for additional features. DynamoDB’s pricing is similar to RDS but reflects its differing functionality. Aurora is priced as RDS when run as RDS but differently when run serverless.

# 4. Maintenance 
## RDS and DynamoDB
Your instances will be maintained by AWS for the most part, with the user having the option to defer certain updates. 
## Redshift
Requires more maintenance. Users are advised to perform ‘vacuuming’, which makes cells from which data has been deleted available for storage. It’s also advised that you monitor your queries’ performance. Using AWS Console, you can check how long it takes for your query to be performed, how much CPU it’s using, and more.  
However, Redshift is still easier to maintain than a traditional database. 
## Aurora
Maintenance is synonymous with RDS’s when run with RDS. When run serverless, there is virtually no maintenance required.

## Conclusion
While all are managed database services, Redshift’s complexity incurs some user maintenance costs. Dynamo DB’s doesn’t. Aurora can be run as a managed database or serverless, requiring very little maintenance.
 
# Summary #
* If you’re most interested in offloading the management costs of a relatively simple database — one with a max volume in the terabytes and standard queries — you’ll probably pick RDS
* If you have the time, financial resources, and the requirement to invest in and maintain a DB service to deal with complex queries and vast amounts of storage need, then Redshift is the one for you
* If you have enterprise-level requirements suited to key-value databases, then you’ll obviously pick DynamoDB
* For an enterprise-level relational database with serverless options, there’s Aurora
* Which database you use depends on your needs, and most people use multiple databases

[AWS Database use cases](https://aws.amazon.com/products/databases/)
