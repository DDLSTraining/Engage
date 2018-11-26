# AWS Services Overview

One of the hardest things to learn when starting out with AWS is the vast array of products offered. This pages gives you a summary of the most commonly used services. Just to get you started.

For a more complete coverage of modern application development and the AWS products available, read the excellent document titled [Architecting for the Cloud - AWS Best Practices](https://d0.awsstatic.com/whitepapers/AWS_Cloud_Best_Practices.pdf).

Service Categories:

* [Compute](#compute)
* [Network](#network)
* [Storage](#storage)
* [Database](#database)
* [Analytics](#analytics)
* [Security & Identity](#security--identity)
* [Applications](#Applications)
* [Management Tools](#management-tools)

## Compute

### Amazon Elastic Compute Cloud (EC2)

[Amazon Elastic Compute Cloud](https://aws.amazon.com/ec2/) (EC2) presents a true virtual computing environment, allowing you to use web service interfaces to launch instances with a variety of operating systems, load them with your custom application environment, manage your network’s access permissions, and run your image using as many or few systems as you desire.

🤔 Think of EC2 as virtual machines in the cloud.

### Amazon Elastic Container Registry (ECR)

[Amazon Elastic Container Registry](https://aws.amazon.com/ecr/) (ECR) is a fully-managed Docker container registry that makes it easy for developers to store, manage, and deploy Docker container images. Amazon ECR is integrated with Amazon Elastic Container Service (ECS), simplifying your development to production workflow.

🤔 Think of ECR as your own private [Docker Hub](https://hub.docker.com/).

### Amazon Elastic Container Service (ECS)

[Amazon Elastic Container Service](https://aws.amazon.com/ecs/) (ECS) is a highly scalable, high-performance container orchestration service that supports Docker containers and allows you to easily run and scale containerized applications on AWS.

🤔 Think virtualized applications without managing the virtual machine instances.

### Amazon Elastic Container Services for Kubernetes (EKS)

[Amazon EKS](https://aws.amazon.com/eks/) makes it easy to deploy, manage, and scale containerized applications using Kubernetes on AWS. The Kubernetes management infrastructure is run across multiple AWS availability zones to eliminate a single point of failure.

[Kubernetes](https://kubernetes.io/) is an open source container orchestration service that has become the default choice for cross platform management and deployment.

ECS is only on AWS, Kubernetes is anywhere. EKS is a managed Kubernetes cluster.

### Amazon Lightsail

[Amazon Lightsail](https://aws.amazon.com/lightsail/features/) Virtual Private Server (VPS) enables you to experience the power and reliability of AWS without the complexity. Deploy in seconds and manage from the intuitive Lightsail management console or API.

🤔 Think of Lightsail as simplified EC2 deployments.

### AWS Batch

[AWS Batch](https://aws.amazon.com/batch/) enables developers, scientists, and engineers to easily and efficiently run hundreds of thousands of batch computing jobs (containers) on AWS. AWS Batch dynamically provisions the optimal quantity and type of compute resources (e.g., CPU or memory optimized instances) based on the volume and specific resource requirements of the batch jobs submitted.

🤔 Think of prioritised queues processing multiple jobs as containers.

### AWS Elastic Beanstalk

[AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS.

🤔 Think of a fully managed application platform. Just deploy your code.

As an alternative take a look at [AWS CodeStar](https://aws.amazon.com/codestar/).

### AWS Lambda

[AWS Lambda](https://aws.amazon.com/lambda/) is a serverless compute service that runs your code in response to events and automatically manages the underlying compute resources for you. You can use AWS Lambda to extend other AWS services with custom logic, or create your own back-end services that operate at AWS scale, performance, and security.

🤔 Think of a single purpose function running in the cloud. Many such functions would be required to build a cloud native application.

## Network

### Amazon CloudFront

[Amazon CloudFront](https://aws.amazon.com/cloudfront/) is a fast content delivery network (CDN) service that securely delivers data, videos, applications, and APIs to customers globally with low latency, high transfer speeds, all within a developer-friendly environment.

🤔 Think of a reverse proxy on steroids.

### Amazon Route 53

[Amazon Route 53](https://aws.amazon.com/route53/) is a highly available and scalable cloud Domain Name System (DNS) web service. You can use Amazon Route 53 to configure DNS health checks to route traffic to healthy endpoints or to independently monitor the health of your application and its endpoints. Amazon Route 53 Traffic Flow makes it easy for you to manage traffic globally through a variety of routing types, including Latency Based Routing, Geo DNS, Geoproximity, and Weighted Round Robin—all of which can be combined with DNS Failover in order to enable a variety of low-latency, fault-tolerant architectures.

🤔 Think plain old DNS on steroids.

### Amazon Virtual Private Cloud (VPC)

[Amazon VPC](https://aws.amazon.com/vpc/) lets you provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define. You have complete control over your virtual networking environment, including selection of your own IP address range, creation of subnets, and configuration of route tables and network gateways.

🤔 Think of virtual routers and switches in the cloud (and so much more).

### AWS Direct Connect

[AWS Direct Connect](https://aws.amazon.com/directconnect/) lets you establish a dedicated network connection between your network and one of the AWS Direct Connect locations. Using industry standard 802.1q VLANs, this dedicated connection can be partitioned into multiple virtual interfaces.

🤔 Think of your private network directly connected into the AWS network.

### Elastic Load Balancing (ELB)

[Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/) automatically distributes incoming application traffic across multiple targets, such as Amazon EC2 instances, containers, and IP addresses. It can handle the varying load of your application traffic in a single Availability Zone or across multiple Availability Zones. Elastic Load Balancing offers three types of load balancers, Application, Network, and Classic, that all feature the high availability, automatic scaling, and robust security necessary to make your applications fault tolerant.

🤔 Think of standard network load balancing on steroids.

## Storage

### Amazon Simple Storage Service (S3)

[Amazon S3](https://aws.amazon.com/s3/) is object storage built to store and retrieve any amount of data from anywhere – web sites and mobile apps, corporate applications, and data from IoT sensors or devices. It is designed to deliver 99.999999999% durability, and stores data for millions of applications used by market leaders in every industry.

🤔 Think of S3 as a database for objects. _It is not a file system._

### Amazon Elastic Block Store (EBS)

[Amazon EBS](https://aws.amazon.com/ebs/) provides persistent block storage volumes (mounts or drives) for use with Amazon EC2 instances in the AWS Cloud. Each Amazon EBS volume is automatically replicated within its Availability Zone to protect you from component failure, offering high availability and durability.

🤔 Think of an unformatted volume within a single virtual machine instance. Pay for what you provision.

### Amazon Elastic File Service (EFS)

[Amazon EFS](https://aws.amazon.com/efs/) provides simple, scalable, elastic file storage for use with AWS Cloud services and on-premises resources. It is easy to use and offers a simple interface that allows you to create and configure file systems quickly and easily.

🤔 Think of a network share like you would get from a file server. Mountable on __multiple systems__. Not very cost effective.

### Amazon Glacier

[Amazon Glacier](https://aws.amazon.com/glacier/) is a secure, durable, and extremely low-cost cloud storage service for data archiving and long-term backup. It is designed to deliver 99.999999999% durability, and provides comprehensive security and compliance capabilities that can help meet even the most stringent regulatory requirements.

🤔 Think of an offsite archive storage service. Single or multipart uploading to archive content. Extremely cost effective if not retrieving content often.

### AWS Snowball

[AWS Snowball](https://aws.amazon.com/snowball/) is a petabyte-scale data transport solution that uses devices designed to be secure to transfer large amounts of data into and out of the AWS Cloud. Using Snowball addresses common challenges with large-scale data transfers including high network costs, long transfer times, and security concerns.

🤔 Think of getting a storage device from AWS, copying lots to it, and sending it back to AWS.

### AWS Storage Gateway

[AWS Storage Gateway](https://aws.amazon.com/storagegateway/) is a hybrid storage service that enables your on-premises applications to seamlessly use AWS cloud storage. You can use the service for backup and archiving, disaster recovery, cloud data processing, storage tiering, and migration. Your applications connect to the service through a virtual machine or hardware gateway appliance using standard storage protocols, such as NFS, SMB and iSCSI.

🤔 Think of a local file server that synchronises to AWS storeage services such as S3, Glacier, and EBS.

## Database

### Amazon DynamoDB

[Amazon DynamoDB](https://aws.amazon.com/dynamodb/) is a nonrelational database that delivers reliable performance at any scale. It's a fully managed, multi-region, multi-master database that provides consistent single-digit millisecond latency, and offers built-in security, backup and restore, and in-memory caching.

🤔 Think of fast application data storage. The single-digit millisecond latency makes DynamoDB an extremely versatile NoSQL database.

### Amazon Relational Database Service (RDS)

[Amazon RDS](https://aws.amazon.com/rds/) makes it easy to set up, operate, and scale a relational database in the cloud. It provides cost-efficient and resizable capacity while automating time-consuming administration tasks such as hardware provisioning, database setup, patching and backups.

🤔 Think of a ANSI standard SQL database server without the complexity.

Supported database engines include: Amazon Aurora (MySQL on steroids), PostgreSQL, MySQL, MariaDB, Oracle, and Microsoft SQL Server.

Consider DynamoDB which is far more cost effective and vastly more scalable.

### Amazon Redshift

[Amazon Redshift](https://aws.amazon.com/redshift/) is a fast, scalable data warehouse that makes it simple and cost-effective to analyze all your data across your data warehouse and data lake. Redshift delivers ten times faster performance than other data warehouses by using machine learning, massively parallel query execution, and columnar storage on high-performance disk.

🤔 Think fully managed business intelligence on big data.

### Amazon ElasticCache

[Amazon ElastiCache](https://aws.amazon.com/elasticache/) offers fully managed Redis and Memcached. Seamlessly deploy, run, and scale popular open source compatible in-memory data stores. Build data-intensive apps or improve the performance of your existing apps by retrieving data from high throughput and low latency in-memory data stores. Amazon ElastiCache is a popular choice for Gaming, Ad-Tech, Financial Services, Healthcare, and IoT apps.

🤔 Think browser session state management for stateless front end services.

## Analytics

### Amazon Athena

Amazon Athena is an interactive query service that makes it easy to analyze data in Amazon S3 using standard SQL. Athena is serverless, so there is no infrastructure to manage, and you pay only for the queries that you run.

Athena is easy to use. Simply point to your data in Amazon S3, define the schema, and start querying using standard SQL. Most results are delivered within seconds. With Athena, there’s no need for complex ETL jobs to prepare your data for analysis. This makes it easy for anyone with SQL skills to quickly analyze large-scale datasets.

🤔 Think SQL queries against your IoT logs or other data.

### Amazon CloudSearch

[Amazon CloudSearch](https://aws.amazon.com/cloudsearch/) is a managed service in the AWS Cloud that makes it simple and cost-effective to set up, manage, and scale a search solution for your website or application. It supports 34 languages and popular search features such as highlighting, autocomplete, and geospatial search.

🤔 Think web search across all your content.

### Amazon Elastic Map Reduce (EMR)

Amazon EMR provides a managed Hadoop framework that makes it easy, fast, and cost-effective to process vast amounts of data across dynamically scalable Amazon EC2 instances. You can also run other popular distributed frameworks such as Apache Spark, HBase, Presto, and Flink in EMR, and interact with data in other AWS data stores such as Amazon S3 and Amazon DynamoDB. EMR Notebooks, based on the popular Jupyter Notebook, provide a development and collaboration environment for ad hoc querying and exploratory analysis.

🤔 Think [Apache Hadoop](https://hadoop.apache.org/) and its applications in the cloud. Hadoop enables distributed processing of large data sets across clusters of computers using simple programming models. This service is handy if you have invested heavily in Hadoop and are moving to the cloud.

### Amazon Elasticsearch Service

[Amazon Elasticsearch Service](https://aws.amazon.com/elasticsearch-service/) is a fully managed service that makes it easy for you to deploy, secure, operate, and scale Elasticsearch to search, analyze, and visualize data in real-time. With Amazon Elasticsearch Service you get easy-to-use APIs and real-time analytics capabilities to power use-cases such as log analytics, full-text search, application monitoring, and clickstream analytics, with enterprise-grade availability, scalability, and security.

[Elasticsearch](https://www.elastic.co/products/elasticsearch) is not an Amazon product. It is a search engine based on the [Lucene library](https://en.wikipedia.org/wiki/Apache_Lucene). It provides a distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents.

🤔 Think web search across all your content using an open-source product (cross platform).

### Amazon Kinesis

[Amazon Kinesis](https://aws.amazon.com/kinesis/) makes it easy to collect, process, and analyze real-time, streaming data so you can get timely insights and react quickly to new information.

With Amazon Kinesis, you can ingest real-time data such as video, audio, application logs, website clickstreams, and IoT telemetry data for machine learning, analytics, and other applications. Amazon Kinesis enables you to process and analyze data as it arrives and respond instantly instead of having to wait until all your data is collected before the processing can begin.

🤔 Think data transformation prior to storage for large data feeds.

### Amazon QuickSight

[Amazon QuickSight](https://aws.amazon.com/quicksight/) is a fast, cloud-powered BI service that makes it easy to build visualizations, perform ad-hoc analysis, and quickly get business insights from your data. Using our cloud-based service you can easily connect to your data, perform advanced analysis, and create stunning visualizations and rich dashboards that can be
accessed from any browser or mobile device.

🤔 Think of a visualization or graphing dashboard in the browser that can connect to your data.

## Security & Identity

### Amazon Inspector

[Amazon Inspector](https://aws.amazon.com/inspector/) is an automated security assessment service that helps improve the security and compliance of applications deployed on AWS. Amazon Inspector automatically assesses applications for exposure, vulnerabilities, and deviations from best practices.

🤔 Think of a datacentre security scan.

### AWS Artifact

[AWS Artifact](https://aws.amazon.com/artifact/) is your go-to, central resource for compliance-related information that matters to you. It provides on-demand access to AWS’ security and compliance reports and select online agreements. Reports available in AWS Artifact include our Service Organization Control (SOC) reports, Payment Card Industry (PCI) reports, and certifications from accreditation bodies across geographies and compliance verticals that validate the implementation and operating effectiveness of AWS security controls. Agreements available in AWS Artifact include the Business Associate Addendum (BAA) and the Nondisclosure Agreement (NDA).

🤔 Think of a tool to help with meeting your regulation compliance.

### AWS Certificate Manager

[AWS Certificate Manager](https://aws.amazon.com/certificate-manager/) is a service that lets you easily provision, manage, and deploy public and private Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificates for use with AWS services and your internal connected resources.

🤔 Think of one tool to manage your web server certificates.

### AWS CloudHSM

[AWS CloudHSM](https://aws.amazon.com/cloudhsm/) is a cloud-based __hardware security module__ (HSM) that enables you to easily generate and use your own encryption keys on the AWS Cloud. With CloudHSM, you can manage your own encryption keys using FIPS 140-2 Level 3 validated HSMs. CloudHSM offers you the flexibility to integrate with your applications using industry-standard APIs, such as PKCS#11, Java Cryptography Extensions (JCE), and Microsoft CryptoNG (CNG) libraries.

🤔 Think highly secure data encryption in the cloud.

### AWS Directory Service

[AWS Directory Service](https://aws.amazon.com/directoryservice/) for Microsoft Active Directory, also known as AWS Managed Microsoft AD, enables your directory-aware workloads and AWS resources to use managed Active Directory in the AWS Cloud. AWS Managed Microsoft AD is built on actual Microsoft Active Directory and does not require you to synchronize or replicate data from your existing Active Directory to the cloud.

🤔 Think of connecting your on-premises Active Directory to the cloud or deploying a stand-alone Active Directory in the cloud.

### AWS Identity and Access Management (IAM)

[AWS Identity and Access Management](https://aws.amazon.com/iam/) (IAM) enables you to manage access to AWS services and resources securely. Using IAM, you can create and manage AWS users and groups, and use permissions to allow and deny their access to AWS resources.

🤔 Think of fine-grained access control, multi-factor authentication, secure client application access, that can integrate with your corporate directory.

### AWS Key Management Service (KMS)

[AWS Key Management Service](https://aws.amazon.com/kms/) (KMS) is a managed service that makes it easy for you to create and control the encryption keys used to encrypt your data, and uses FIPS 140-2 validated hardware security modules to protect the security of your keys. AWS Key Management Service is also integrated with AWS CloudTrail to provide you with logs of all key usage to help meet your regulatory and compliance needs.

🤔 Think of a central tool to manage data encryption keys.

### AWS Organizations

[AWS Organizations](https://aws.amazon.com/organizations/) offers policy-based management for multiple AWS accounts. With Organizations, you can create groups of accounts, automate account creation, apply and manage policies for those groups. Organizations enables you to centrally manage policies across multiple accounts, without requiring custom scripts and manual processes.

🤔 Think high level organization management and control.

### AWS Shield

[AWS Shield](https://aws.amazon.com/shield/) is a managed Distributed Denial of Service (DDoS) protection service that safeguards applications running on AWS. AWS Shield provides always-on detection and automatic inline mitigations that minimize application downtime and latency, so there is no need to engage AWS Support to benefit from DDoS protection.

🤔 Think of a data bouncer at the door of your cloud. Big bloke, masive arms, you know the type.

### AWS Web Application Firewall (WAF)

[AWS WAF](https://aws.amazon.com/waf/) is a web application firewall that helps protect your web applications from common web exploits that could affect application availability, compromise security, or consume excessive resources. You can use AWS WAF to create custom rules that block common attack patterns, such as SQL injection or cross-site scripting, and rules that are designed for your specific application.

🤔 Think of the bouncers that wonder through the club protecting your application.

## Applications

### Amazon WorkDocs

[Amazon WorkDocs](https://aws.amazon.com/workdocs/) enables you to store all of your files on one service. Users can create content, share files, provide rich feedback, and access their files on WorkDocs from any device.

🤔 Think of a collaboration site or team site to work and share documents.

### Amazon WorkMail

[Amazon WorkMail](https://aws.amazon.com/workmail/) is a secure, managed business email and calendar service with support for existing desktop and mobile email client applications. You can integrate Amazon WorkMail with your existing corporate directory, use email journaling to meet compliance requirements, and control both the keys that encrypt your data and the location in which your data is stored. You can also set up interoperability with Microsoft Exchange Server, and programmatically manage users, groups, and resources using the Amazon WorkMail SDK.

🤔 Think cloud based email and personal management software, calendar etc.

### Amazon AppStream

[Amazon AppStream](https://aws.amazon.com/appstream2/) 2.0 is a fully managed application streaming service. You centrally manage your desktop applications on AppStream 2.0 and securely deliver them to any computer. You can easily scale to any number of users across the globe without acquiring, provisioning, and operating hardware or infrastructure.

🤔 Think Terminal Services or Citrix application streaming.

### Amazon WorkSpaces

[Amazon WorkSpaces](https://aws.amazon.com/workspaces/) is a managed, secure cloud desktop service. You can use Amazon WorkSpaces to provision either Windows or Linux desktops in just a few minutes and quickly scale to provide thousands of desktops to workers across the globe.

🤔 Think Virtual Desktop Infrastructure without the fuss and bother.

## Management Tools

### Auto Scaling

[AWS Auto Scaling](https://aws.amazon.com/autoscaling/) monitors your applications and automatically adjusts capacity to maintain steady, predictable performance at the lowest possible cost. The service provides a simple, powerful user interface that lets you build scaling plans for resources including Amazon EC2 instances and Spot Fleets, Amazon ECS tasks, Amazon DynamoDB tables and indexes, and Amazon Aurora Replicas.

🤔 Think centralised control of automatic scaling for your AWS resources.

### Amazon CloudWatch

[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) is a monitoring and management service built for developers, system operators, site reliability engineers (SRE), and IT managers. CloudWatch collects monitoring and operational data in the form of logs, metrics, and events, providing you with a unified view of AWS resources, applications and services that run on AWS, and on-premises servers.

🤔 Think logging and monitoring dashboard and so much more.

### AWS Trusted Advisor

[AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/trustedadvisor/) is an online resource to help you reduce cost, increase performance, and improve security by optimizing your AWS environment. Trusted Advisor provides real time guidance to help you provision your resources following AWS best practices.

🤔 Think cost and price optimizing support.
