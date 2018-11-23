# AWS Foundational Services Overview

One of the hardest things to learn when starting with AWS is the vast array of products offered. This pages gives you a summary of the most commonly used services. Just to get you started.

For a more complete coverage of modern application development and the AWS products available, read the 50 page [Architecting for the Cloud - AWS Best Practices](https://d0.awsstatic.com/whitepapers/AWS_Cloud_Best_Practices.pdf) document.

## Compute

### Amazon Elastic Compute Cloud (EC2)

[Amazon Elastic Compute Cloud](https://aws.amazon.com/ec2/) (EC2) presents a true virtual computing environment, allowing you to use web service interfaces to launch instances with a variety of operating systems, load them with your custom application environment, manage your network’s access permissions, and run your image using as many or few systems as you desire.

### Amazon Elastic Container Registry (ECR)

[Amazon Elastic Container Registry](https://aws.amazon.com/ecr/) (ECR) is a fully-managed Docker container registry that makes it easy for developers to store, manage, and deploy Docker container images. Amazon ECR is integrated with Amazon Elastic Container Service (ECS), simplifying your development to production workflow.

### Amazon Elastic Container Service (ECS)

[Amazon Elastic Container Service](https://aws.amazon.com/ecs/) (ECS) is a highly scalable, high-performance container orchestration service that supports Docker containers and allows you to easily run and scale containerized applications on AWS.

### Amazon Lightsail

[Amazon Lightsail](https://aws.amazon.com/lightsail/features/) Virtual Private Server (VPS) enables you to experience the power and reliability of AWS without the complexity. Deploy in seconds and manage from the intuitive Lightsail management console or API.

### AWS Batch

[AWS Batch](https://aws.amazon.com/batch/) enables developers, scientists, and engineers to easily and efficiently run hundreds of thousands of batch computing jobs (containers) on AWS. AWS Batch dynamically provisions the optimal quantity and type of compute resources (e.g., CPU or memory optimized instances) based on the volume and specific resource requirements of the batch jobs submitted.

### AWS Elastic Beanstalk

[AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS.

### AWS Lambda

[AWS Lambda](https://aws.amazon.com/lambda/) is a serverless compute service that runs your code in response to events and automatically manages the underlying compute resources for you. You can use AWS Lambda to extend other AWS services with custom logic, or create your own back-end services that operate at AWS scale, performance, and security.

## Network

### Amazon CloudFront

[Amazon CloudFront](https://aws.amazon.com/cloudfront/) is a fast content delivery network (CDN) service that securely delivers data, videos, applications, and APIs to customers globally with low latency, high transfer speeds, all within a developer-friendly environment.

### Amazon Route 53

[Amazon Route 53](https://aws.amazon.com/route53/) is a highly available and scalable cloud Domain Name System (DNS) web service. You can use Amazon Route 53 to configure DNS health checks to route traffic to healthy endpoints or to independently monitor the health of your application and its endpoints. Amazon Route 53 Traffic Flow makes it easy for you to manage traffic globally through a variety of routing types, including Latency Based Routing, Geo DNS, Geoproximity, and Weighted Round Robin—all of which can be combined with DNS Failover in order to enable a variety of low-latency, fault-tolerant architectures.

### Amazon Virtual Private Cloud (VPC)

[Amazon VPC](https://aws.amazon.com/vpc/) lets you provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define. You have complete control over your virtual networking environment, including selection of your own IP address range, creation of subnets, and configuration of route tables and network gateways.

### AWS Direct Connect

[AWS Direct Connect](https://aws.amazon.com/directconnect/) lets you establish a dedicated network connection between your network and one of the AWS Direct Connect locations. Using industry standard 802.1q VLANs, this dedicated connection can be partitioned into multiple virtual interfaces.

### Elastic Load Balancing (ELB)

[Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/) automatically distributes incoming application traffic across multiple targets, such as Amazon EC2 instances, containers, and IP addresses. It can handle the varying load of your application traffic in a single Availability Zone or across multiple Availability Zones. Elastic Load Balancing offers three types of load balancers, Application, Network, and Classic, that all feature the high availability, automatic scaling, and robust security necessary to make your applications fault tolerant.

## Storage

### Amazon Simple Storage Service (S3)

[Amazon S3](https://aws.amazon.com/s3/) is object storage built to store and retrieve any amount of data from anywhere – web sites and mobile apps, corporate applications, and data from IoT sensors or devices. It is designed to deliver 99.999999999% durability, and stores data for millions of applications used by market leaders in every industry.

Not a file system. Think a database for objects.

### Amazon Elastic Block Store (EBS)

[Amazon EBS](https://aws.amazon.com/ebs/) provides persistent block storage volumes (mounts or drives) for use with Amazon EC2 instances in the AWS Cloud. Each Amazon EBS volume is automatically replicated within its Availability Zone to protect you from component failure, offering high availability and durability.

An unformatted volume within a single virtual machine instance. Pay for what you provision.

### Amazon Elastic File Service (EFS)

[Amazon EFS](https://aws.amazon.com/efs/) provides simple, scalable, elastic file storage for use with AWS Cloud services and on-premises resources. It is easy to use and offers a simple interface that allows you to create and configure file systems quickly and easily.

A shared directory like you would get from a file server. Mountable on __multiple systems__. Not very cost effective.

### Amazon Glacier

[Amazon Glacier](https://aws.amazon.com/glacier/) is a secure, durable, and extremely low-cost cloud storage service for data archiving and long-term backup. It is designed to deliver 99.999999999% durability, and provides comprehensive security and compliance capabilities that can help meet even the most stringent regulatory requirements.

Single or multipart uploading to archive content. Extremely cost effective if not retrieving content often.

### AWS Snowball

[AWS Snowball](https://aws.amazon.com/snowball/) is a petabyte-scale data transport solution that uses devices designed to be secure to transfer large amounts of data into and out of the AWS Cloud. Using Snowball addresses common challenges with large-scale data transfers including high network costs, long transfer times, and security concerns.

### AWS Storage Gateway

[AWS Storage Gateway](https://aws.amazon.com/storagegateway/) is a hybrid storage service that enables your on-premises applications to seamlessly use AWS cloud storage. You can use the service for backup and archiving, disaster recovery, cloud data processing, storage tiering, and migration. Your applications connect to the service through a virtual machine or hardware gateway appliance using standard storage protocols, such as NFS, SMB and iSCSI.

A local file server that synchronises to AWS storeage services such as S3, Glacier, and EBS.

## Database Services

### Amazon DynamoDB

### Amazon Relational Database Service (RDS)


## Security & Identity

### Amazon Inspector

### AWS Artifact

### AWS Certificate Manager

### AWS CloudHMS

### AWS Directory Service

### AWS Identity and Access Management (IAM)

### AWS KMS

### AWS Organizations

### AWS Shield

### AWS WAF


## Applications

### Amazon WorkDocs

### Amazon WorkMail

### Amazon AppStream

### Amazon WorkSpaces


## Management Tools

### Auto Scaling

### Amazon CloudWatch

### AWS Trusted Advisor
