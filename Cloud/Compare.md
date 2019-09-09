# Compare Cloud Products and Services

This document contains simple comparisons between AWS, Azure, and GCP.

Most of the comparisons will be from the vendors documentation and are not guaranteed to be accurate.

## Comparison Resources

* [AWS - Google - Azure Cloud Comparison](https://caylent.com/aws-google-azure-cloud-comparison/)
* [AWS - Azure - Google Cloud - IBM Cloud (Right Scale)](https://www.rightscale.com/cloud-comparison-tool/)
* Cloud Provider Regions:
  * [AWS Infrastructure](https://www.infrastructure.aws/)
  * [GCP Infrastructure](https://cloud.google.com/about/locations/#regions-tab)
  * [Azure Infrastructure](https://azure.microsoft.com/en-au/global-infrastructure/regions/)
* [AWS vs. Azure vs. Google: Cloud Comparison [2019 Update]](https://www.datamation.com/cloud-computing/aws-vs-azure-vs-google-cloud-comparison.html)

### Articles

* 2019-01-22 - [AWS vs. Azure vs. Google: Cloud Comparison [2019 Update]](https://www.datamation.com/cloud-computing/aws-vs-azure-vs-google-cloud-comparison.html)
* 2018-12-14 - [Cockroach Labs - 2018 Cloud Report](https://www.cockroachlabs.com/blog/2018_cloud_report/) - AWS Outperforms GCP
  * 2018-12-14 - [Hacker News Related Thread](https://news.ycombinator.com/item?id=18673541)
* 2018-06-06 - [Public Cloud Object-store Performance is Very Unequal across AWS S3, Google Cloud Storage, and Azure Blob Storage](https://dev.to/sachinkagarwal/public-cloud-object-store-performance-is-very-unequal-across-aws-s3-google-cloud-storage-and-azure-blob-storage-13do)
* 2015-12-29 - [AWS S3 vs GCS vs Azure Storage](http://blog.zachbjornson.com/2015/12/29/cloud-storage-performance.html)

## Cloud Service Mapping

The following links map services from one provider to the other:

* [AWS to GCP (by Google)](https://cloud.google.com/free/docs/map-aws-google-cloud-platform)
* [Azure to GCP (by Google)](https://cloud.google.com/free/docs/map-azure-google-cloud-platform)
* [AWS to Azure (by Microsoft)](https://docs.microsoft.com/en-us/azure/architecture/aws-professional/services)
* [AWS vs. Azure vs. Google: Cloud Comparison [2019 Update]](https://www.datamation.com/cloud-computing/aws-vs-azure-vs-google-cloud-comparison.html) - Scroll to the bottom of the article.

## Cloud Provider Price Links

| Type | AWS | Azure | GCP | Compare |
|-|-|-|-|-|
|Calculator|[Current](https://calculator.s3.amazonaws.com/index.html) - [New](https://calculator.aws/#/)| [Calculator](https://azure.microsoft.com/en-au/pricing/calculator/)| [Calculator](https://cloud.google.com/products/calculator/)||
|DBaaS Table|[DynamoDB](https://aws.amazon.com/dynamodb/pricing/)|[Tables Storage](https://azure.microsoft.com/en-au/pricing/details/storage/tables/)|[Bigtable](https://cloud.google.com/bigtable/pricing)|[DB-Engines](https://db-engines.com/en/system/Amazon+DynamoDB%3BGoogle+Cloud+Bigtable%3BMicrosoft+Azure+Cosmos+DB%3BMicrosoft+Azure+Table+Storage)|
|DBaaS Document|[DynamoDB](https://aws.amazon.com/dynamodb/pricing/)|[Cosmos DB](https://azure.microsoft.com/en-au/pricing/details/cosmos-db/)|[Cloud Firestore](https://cloud.google.com/firestore/pricing)|[DB-Engines](https://db-engines.com/en/system/Amazon+DynamoDB%3BGoogle+Cloud+Firestore%3BMicrosoft+Azure+Cosmos+DB)|
|IaaS Compute|[EC2 On-Demand](https://aws.amazon.com/ec2/pricing/on-demand/)|[VMs](https://azure.microsoft.com/en-au/pricing/details/virtual-machines/series/) ([Compare](https://azureprice.net/?region=australiaeast&timeoption=month&currency=AUD))|[Compute Engine](https://cloud.google.com/compute/all-pricing)||
|IaaS Kubernetes|[EKS](https://aws.amazon.com/eks/pricing/)|[AKS](https://azure.microsoft.com/en-au/pricing/details/kubernetes-service/)|[Kubernetes Engine](https://cloud.google.com/kubernetes-engine/pricing)||
|IaaS Batch|[Batch](https://aws.amazon.com/batch/pricing/)|[Batch](https://azure.microsoft.com/en-au/pricing/details/batch/)|[Cloud Dataflow](https://cloud.google.com/dataflow/pricing)||
|IaaS Containers|[ECS (EC2)](https://aws.amazon.com/ecs/pricing/)|[Container Instances](https://azure.microsoft.com/en-au/pricing/details/container-instances/)|[App Engine Flexible](https://cloud.google.com/appengine/pricing)||
|PaaS Web App|[Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/pricing/)|App Service [Win](https://azure.microsoft.com/en-au/pricing/details/app-service/windows/) : [Linux](https://azure.microsoft.com/en-au/pricing/details/app-service/linux/)|[App Engine Standard](https://cloud.google.com/appengine/pricing)|
|Serverless Functions|[Lambda](https://aws.amazon.com/lambda/pricing/)*|[Functions](https://azure.microsoft.com/en-au/pricing/details/functions/)*|[Cloud Functions](https://cloud.google.com/functions/pricing)*||
|Serverless Containers|[ECS (Fargate)](https://aws.amazon.com/fargate/pricing/)|[Container Instances](https://azure.microsoft.com/en-au/pricing/details/container-instances/)|[Cloud Run](https://cloud.google.com/run/pricing)*||

[*] Pay per execution or invocation.

## Static Documented Comparisons

### Functions (Lambda)

Last updated: 2019-02-16

_Note: Prices are USD_

| Platform | Free Inv | Invocations | Free Compute | Compute | Free Network | Network |
|-|-|-|-|-|-|-|
| AWS | 1M | $0.20 per 1M | 400,000 GB-s | $0.00001667 GB-s | 1GB | $0.09 per GB |
| Azure | 1M | $0.275 per 1M | 400,000 GB-s | $0.000022 per GB-s | 5GB | $0.165 per GB |
| GCP | 2M | $0.40 per 1M | 1M GB-s | $0.0000025 per GB-s | 5GB | $0.12 per GB |

### Regions

Last updated: 2018-09-17

|| [AWS](https://aws.amazon.com/about-aws/global-infrastructure/) | [Azure](https://azure.microsoft.com/en-au/global-infrastructure/regions/) | [GCP](https://cloud.google.com/about/locations/) |
|---------|----|----|----|
| Regions | 18 | 54 | 17 |
| Zones   | 55 |    | 52 |

