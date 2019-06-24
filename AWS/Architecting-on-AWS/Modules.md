# Architecting on AWS Course v6.4

## Module Links and References

### Module 1: Introduction

* What is the cloud? What is AWS?
* Well-Architected Framework
* AWS global infrastructure
* Large-scale architectural design

* [AWS Global Infrastructure](https://aws.amazon.com/about-aws/global-infrastructure/)
  * [CloudFront Edge Locations](https://aws.amazon.com/cloudfront/features/)
* [Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/):
  * [AWS Well-Architected Tool](https://aws.amazon.com/well-architected-tool/)

### Module 2:The Simplest Architectures

* Amazon Simple Storage Service (Amazon S3)
* Amazon Glacier
* Choosing Regions for your Architectures
* **Lab 1**: Hosting a Static Website

### Module 3: Adding A Compute Layer

* Amazon Elastic Compute Cloud (Amazon EC2)
* Launching Amazon EC2 Instances with Amazon Machine Images (AMIs)
* Launching Amazon EC2 Instances with User Data
* Amazon EC2 and Storing Data
* Amazon EC2 Instance Types
* Amazon EC2 Pricing Options
* Amazon EC2 Considerations

### Module 4: Adding A Database Layer

* Database Layer Considerations
* Amazon RDS and Amazon DynamoDB
* Security Controls for Amazon RDS and DynamoDB
* Migrating Data into your AWS Databases
* **Lab 2**: Deploying a Web Application on AWS

### Module 5: Networking In AWS Part 1

* Amazon Virtual Private Cloud (VPC)
* Security in the Cloud
* Review
* **Lab 3**: Creating a Virtual Private Cloud

### Module 6: Networking In AWS Part 2

* Connecting Networks
* Load Balancing on AWS
* High Availability
* Multi-Region High Availability and DNS

### Module 7: AWS Identity and Access Management

* Account Users and IAM
* Organizing My Users
* Federating Users
* Multiple Accounts
* Review

* [Root User](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html):
  * [IAM Best Practices (Secure the Root User Account)](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
  * [AWS Tasks That Require AWS Account Root User Credentials](https://docs.aws.amazon.com/general/latest/gr/aws_tasks-that-require-root.html)
* [Policies and Permissions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html)
  * [IAM JSON Policy Reference](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html)
  * [Example IAM Identity-Based Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_examples.html)
  * [Managed Policies and Inline Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html)
* [Temporary Security Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html)  

### Module 8: Elasticity, High Availability, and Monitoring

* Understanding The Basics
* Monitoring
* Gaining Elasticity and Scaling Your Architecture
* Scaling Your Databases
* **Lab 4**: Creating a Highly Available Environment

* [EC2 Auto Scaling](https://aws.amazon.com/ec2/autoscaling/)

### Module 9: Automation

* Why Should You Automate?
* Automating Your Infrastructure
* Automating Deployments
* A Little More Hands Off
* **Lab 5**: Automating Infrastructure Deployment with AWS CloudFormation

### Module 10: Caching

* Caching Overview
* Caching On AWS
* Caching Your Web Tier
* Caching Your Database

### Module 11: Building Decoupled Architectures

* Decoupling Your Architecture
* Decoupling with Amazon SQS
* Decoupling with Amazon SNS

### Module 12: Microservices and Serverless Architectures

* Building Microservices
* Container Services
* Going Serverless
* **Lab 6**: Implementing a Serverless Architecture with AWS Managed Services

### Module 13: RTO/RPO and Backup Recovery Setup

* Disaster Planning
* Recovery Strategies

### Module 14: Optimizations and Review

* Questions to ask yourself
* Re-Architecting
* Best Practices: A Review
* Group Challenge
* Design an Architecture

