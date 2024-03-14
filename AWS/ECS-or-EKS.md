# Amazon ECS v EKS
## Amazon ECS
Is AWS's proprietary managed container orchestration service and has the benefits of more integrated with other AWS services such as IAM, ELB, VPC... 
## Amazon EKS
Provides an AWS-managed Kubernetes service that simplifies the task of deploying a high-available, scalable, and fully managed Kubernetes control-plane

## Amazon ECS - Overview
**Amazon Elastic Container Service (Amazon ECS)** is a highly scalable, high performance container orchestration service that supports Docker containers and allows you to easily run and scale containerized applications on AWS. 
ECS is built to perform at scale, offers high availability and security, and is deeply integrated with a variety of AWS services, including Elastic Load Balancing, Amazon VPC, AWS IAM, and more. 
Additionally, Amazon ECS features **AWS Fargate**, so you can deploy containers without provisioning servers, ultimately reducing management overhead.
There can be arguments made in favor of ECS over EKS in that it is simpler to use, provides heightened security due to its  integration with IAM, and is more cost-effective. But before we delve into this further, let’s briefly review Amazon EKS.

## Amazon EKS - Overview
**Amazon Elastic Container Service for Kubernetes (Amazon EKS)** makes it easy to deploy, manage, and scale containerized applications using Kubernetes on AWS. Since this service leverages the open-source tool Kubernetes, all applications managed by Amazon EKS are fully compatible with applications managed by any standard Kubernetes environment. 

In that sense, it can be argued that Amazon EKS is more versatile than Amazon ECS.

## Amazon ECS vs. EKS: Compare and Contrast

**Pricing**
One primary difference between ECS and EKS is the pricing model.
With ECS, there is no additional charge for EC2 (elastic cloud compute) launch types. Instead, users pay for AWS resources you create to store and run applications. You only pay for what you use and there are no additional pricing concerns.

EKS’ pricing model includes the same conditions as ECS, but there are additional costs. Users pay around $0.20/hour for each Amazon EKS cluster. This isn’t as bad as it sounds though, as users can take advantage of a single cluster to run multiple applications by taking advantage of Kubernetes namespaces and IAM security.

**Security**
There can be arguments made in favor of both Amazon ECS and EKS with regards to security. Amazon ECS is deeply integrated with IAM, enabling customers to assign granular access permissions for each container and using IAM to restrict access to each service and delegate the resources that a container can access. 
EKS, conversely, does not have this integration.  However, an argument for EKS is that it can support a much higher number of running pods (Containers) per EC2 worker than ECS due to the way it uses ENIs. And although IAM Roles cannot be applied natively to pods in EKS, there are add ons that allow this functionality, like KIAM.

**Compatibility**
Since EKS is a **Kubernetes-as-a-service** offering for AWS, it can be run on any infrastructure, meaning that it’s much easier to run on-premises or with a different service provider. This isn’t the case for ECS, though, as it’s offered exclusively for AWS.

## The Bigger Picture
Since Amazon ECS currently offers more in-depth AWS integration than Amazon EKS, it may be considered the advisable choice if you’re looking to work solely in the AWS cloud. However, if you’re looking to run container deployments across multiple infrastructure providers and need additional flexibility provided by Kubernetes, Amazon EKS offers more versatility.

