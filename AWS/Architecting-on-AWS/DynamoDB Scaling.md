# DynamoDB Scaling on-demand or provisioned capacity

Even though a DynamoDB table can technically scale to virtually any volume, there are important considerations regarding read and write capacity allocations for DynamoDB tables.

If usage exceeds the allocated capacity, the application will return errors, but if capacity is over-provisioned you will pay more than necessary, remember the cost of a DynamoDB table can easily reach hundreds or even thousands of dollars per month. 

So, it's important to make sure capacity is allocated properly.

# The two ways DynamoDB defines capacity:
* **Read request units**. One strongly consistent read or two eventually consistent reads for a data block of up to 4 KB.
* **Write request units**. One write request for a data block of up to 1 KB.

DynamoDB offers two types of capacity allocation: **on-demand** and **provisioned**. 

## On-demand capacity
* Here pricing is based on the amount of read and write request units the application consumes throughout the month.
* Application owners don't have to explicitly configure read/write capacity. 
* DynamoDB can immediately serve all incoming read/write requests, regardless of volume that is as long as traffic doesn't exceed twice the amount of the highest recorded level. 
* If volume exceeds this limit, capacity is eventually allocated, but it can take up to 30 minutes to be available.

## Provisioned capacity
* You assign read/write capacity units and pay based on the allocated capacity. 
* Usage is billed hourly, regardless of how much of that capacity was consumed. 
* If the application exceeds the provisioned capacity, AWS throttles the requests, and the application won't be able to read or write data during those periods.

## Price and use for DynamoDB on-demand against provisioned capacity
* **On-demand** is a good option for applications that have unpredictable or sudden spikes, since it automatically provisions read/write capacity. 
* **Provisioned capacity** is suitable for applications with predictable usage.
* In combination with DynamoDB Auto Scaling, the **provisioned capacity** variant can dynamically adjust capacity during periods of high usage. 
* Remember that Auto Scaling reacts to usage metrics, so there's typically a delay of at least one minute before adjustments can be applied to a table, which might not be fast enough to prevent application errors during steep usage spikes.
* While **on-demand** delivers the best fit for scalability, the cost is approximately seven times higher than **provisioned capacity**. 
* Also, **provisioned capacity** offers the option to purchase reserved capacity, which can save between 40% and 80% compared to non-reserved provisioned capacity. This means **on-demand** could cost between 15 times and 20 times more than reserved provisioned capacity for some configurations. 
* For small applications, the flexibility of **on-demand** may be worth the extra cost, but for large applications, it can mean spending hundreds or thousands of dollars more per month.

The choice between DynamoDB **on-demand** or **provisioned capacity** depends on which is the better fit for your applications.

**On-demand** is good for small applications or for large applications with steep and unpredictable spikes that DynamoDB Auto Scaling cannot react to fast enough. 

For most other applications, **provisioned capacity** is likely a better option when factoring in cost.

For more information see: 
* [DynamoDB - Auto Scaling Performance and Cost Optimization](https://aws.amazon.com/blogs/database/amazon-dynamodb-auto-scaling-performance-and-cost-optimization-at-any-scale/)
