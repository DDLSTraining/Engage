# Compare Cloud Products and Services

This document contains comparisons between AWS, Azure, and GCP.

* [Historical trends in the usage statistics of web hosting providers](https://w3techs.com/technologies/history_overview/web_hosting)


## CochroachLabs Cloud Report

CochroachLabs develop a NewSQL database called CochroachDB. Architected for the cloud, CockroachDB delivers resilient, consistent, distributed SQL at your scale.

CochroachLabs have produced an in-depth technical performance analysis of their database operating in AWS, Azure, and GCP. Use the links below to access a copy from Engage or from CochroachLabs. The report is licensed under Creative Commons License (CC BY 4.0):

* 2021 Cloud Report:
  * [PDF](2021-cloud-report-cockroach-labs.pdf)
  * [Website (email required)](https://www.cockroachlabs.com/guides/2021-cloud-report/)

## Comparison Resources

* [AWS - Google - Azure Cloud Comparison](https://caylent.com/aws-google-azure-cloud-comparison/)
* [AWS - Azure - Google Cloud - IBM Cloud (Right Scale)](https://www.rightscale.com/cloud-comparison-tool/)
* Cloud Provider Regions:
  * [AWS Infrastructure](https://www.infrastructure.aws/)
  * [GCP Infrastructure](https://cloud.google.com/about/locations/#regions-tab)
  * [Azure Infrastructure](https://azure.microsoft.com/en-au/global-infrastructure/regions/)
* [AWS vs. Azure vs. Google: Cloud Comparison [2019 Update]](https://www.datamation.com/cloud-computing/aws-vs-azure-vs-google-cloud-comparison.html)

### Articles

* 2020-05-28: [Static webhosting benchmark: AWS, Google, Firebase, Netlify, GitHub & Cloudflare](https://www.savjee.be/2020/05/benchmarking-static-website-hosting-providers/)
* 2020-03-02: [Cloud Market Share – a Look at the Cloud Ecosystem in 2020](https://kinsta.com/blog/cloud-market-share/)
* 2020-09-27: [Comparing Machine Learning as a Service: Amazon, Microsoft Azure, Google Cloud AI, IBM Watson](https://www.altexsoft.com/blog/datascience/comparing-machine-learning-as-a-service-amazon-microsoft-azure-google-cloud-ai-ibm-watson/)
* 2019-07-29: [Gartner Says Worldwide IaaS Public Cloud Services Market Grew 31.3% in 2018 ](https://www.gartner.com/en/newsroom/press-releases/2019-07-29-gartner-says-worldwide-iaas-public-cloud-services-market-grew-31point3-percent-in-2018)
* 2019-07-13: [Gartner Forecasts Worldwide Public Cloud Revenue to Grow 17% in 2020](https://www.gartner.com/en/newsroom/press-releases/2019-11-13-gartner-forecasts-worldwide-public-cloud-revenue-to-grow-17-percent-in-2020)
* 2019-01-22: [AWS vs. Azure vs. Google: Cloud Comparison [2019 Update]](https://www.datamation.com/cloud-computing/aws-vs-azure-vs-google-cloud-comparison.html)
* 2018-12-14: [Cockroach Labs - 2018 Cloud Report](https://www.cockroachlabs.com/blog/2018_cloud_report/) - AWS Outperforms GCP
  * 2018-12-14: [Hacker News Related Thread](https://news.ycombinator.com/item?id=18673541)
* 2018-06-06: [Public Cloud Object-store Performance is Very Unequal across AWS S3, Google Cloud Storage, and Azure Blob Storage](https://dev.to/sachinkagarwal/public-cloud-object-store-performance-is-very-unequal-across-aws-s3-google-cloud-storage-and-azure-blob-storage-13do)
* 2015-12-29: [AWS S3 vs GCS vs Azure Storage](http://blog.zachbjornson.com/2015/12/29/cloud-storage-performance.html)

## Cloud Service Mapping

The following links map services from one provider to the other:

* [AWS to GCP (by Google)](https://cloud.google.com/free/docs/map-aws-google-cloud-platform)
* [Azure to GCP (by Google)](https://cloud.google.com/free/docs/map-azure-google-cloud-platform)
* [AWS to Azure (by Microsoft)](https://docs.microsoft.com/en-us/azure/architecture/aws-professional/services)
* [AWS vs. Azure vs. Google: Cloud Comparison [2019 Update]](https://www.datamation.com/cloud-computing/aws-vs-azure-vs-google-cloud-comparison.html) - Scroll to the bottom of the article.

## Cloud Provider Pricing Table

_Most of the comparisons below will be from the vendors documentation and are not guaranteed to be accurate. Prices are in USD unless stated._

| Type | AWS | Azure | GCP | Compare |
|-|-|-|-|-|
|Calculator|[Current](https://calculator.s3.amazonaws.com/index.html) - [New](https://calculator.aws/#/)| [Calculator](https://azure.microsoft.com/en-au/pricing/calculator/)| [Calculator](https://cloud.google.com/products/calculator/)||
|DBaaS Table|[DynamoDB](https://aws.amazon.com/dynamodb/pricing/)|[Tables Storage](https://azure.microsoft.com/en-au/pricing/details/storage/tables/)|[Bigtable](https://cloud.google.com/bigtable/pricing)|[DB-Engines](https://db-engines.com/en/system/Amazon+DynamoDB%3BGoogle+Cloud+Bigtable%3BMicrosoft+Azure+Cosmos+DB%3BMicrosoft+Azure+Table+Storage)|
|DBaaS Document|[DynamoDB](https://aws.amazon.com/dynamodb/pricing/)|[Cosmos DB](https://azure.microsoft.com/en-au/pricing/details/cosmos-db/)|[Cloud Firestore](https://cloud.google.com/firestore/pricing)|[DB-Engines](https://db-engines.com/en/system/Amazon+DynamoDB%3BGoogle+Cloud+Firestore%3BMicrosoft+Azure+Cosmos+DB)|
|IaaS Compute|[EC2 On-Demand](https://aws.amazon.com/ec2/pricing/on-demand/)|[VMs](https://azure.microsoft.com/en-au/pricing/details/virtual-machines/series/) ([Compare](https://azureprice.net/?region=australiaeast&timeoption=month&currency=AUD))|[Compute Engine](https://cloud.google.com/compute/all-pricing)||
|IaaS Kubernetes|[EKS](https://aws.amazon.com/eks/pricing/)|[AKS](https://azure.microsoft.com/en-au/pricing/details/kubernetes-service/)|[Kubernetes Engine](https://cloud.google.com/kubernetes-engine/pricing)||
|IaaS Batch|[Batch](https://aws.amazon.com/batch/pricing/)|[Batch](https://azure.microsoft.com/en-au/pricing/details/batch/)|[Cloud Dataflow](https://cloud.google.com/dataflow/pricing)||
|IaaS Containers|[ECS (EC2)](https://aws.amazon.com/ecs/pricing/)|[Container Instances](https://azure.microsoft.com/en-au/pricing/details/container-instances/)|[App Engine Flexible](https://cloud.google.com/appengine/pricing)||
|Network CDN|[CloudFront](https://aws.amazon.com/cloudfront/pricing/)|[CDN](https://azure.microsoft.com/en-au/pricing/details/cdn/)|[Cloud CDN](https://cloud.google.com/cdn/pricing)||
|Network DNS(LB)|[Route 53](https://aws.amazon.com/route53/pricing/)|[Traffic Manager](https://azure.microsoft.com/en-au/pricing/details/traffic-manager/)|[Cloud DNS](https://cloud.google.com/dns/pricing)||
|Network LB|[ELB](https://aws.amazon.com/elasticloadbalancing/pricing/)|[Load Balancer](https://azure.microsoft.com/en-au/pricing/details/load-balancer/)|[Load Balancing](https://cloud.google.com/compute/all-pricing#lb)||
|Network Private|[Direct Connect](https://aws.amazon.com/directconnect/pricing/)|[Express Route](https://azure.microsoft.com/en-au/pricing/details/expressroute/)|[Interconnect](https://cloud.google.com/interconnect/pricing)||
|Network Egress|[Data Transfer](https://aws.amazon.com/ec2/pricing/on-demand/)|[Bandwidth](https://azure.microsoft.com/en-au/pricing/details/bandwidth/)|[Service Tiers](https://cloud.google.com/network-tiers/pricing)||
|Network VPN|[VPN](https://aws.amazon.com/vpn/pricing/)|[VPN Gateway](https://azure.microsoft.com/en-au/pricing/details/vpn-gateway/)|[Cloud VPN](https://cloud.google.com/vpn/pricing)||
|PaaS Web App|[Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/pricing/)|App Service [Win](https://azure.microsoft.com/en-au/pricing/details/app-service/windows/) : [Linux](https://azure.microsoft.com/en-au/pricing/details/app-service/linux/)|[App Engine Standard](https://cloud.google.com/appengine/pricing)|
|Serverless Containers|[ECS (Fargate)](https://aws.amazon.com/fargate/pricing/)|[Container Instances](https://azure.microsoft.com/en-au/pricing/details/container-instances/)|[Cloud Run](https://cloud.google.com/run/pricing)*||
|Serverless Functions|[Lambda](https://aws.amazon.com/lambda/pricing/)*|[Functions](https://azure.microsoft.com/en-au/pricing/details/functions/)*|[Cloud Functions](https://cloud.google.com/functions/pricing)*||
|Serverless Workflow|[Step Functions](https://aws.amazon.com/step-functions/pricing/)*|[Logic Apps](https://azure.microsoft.com/en-au/pricing/details/logic-apps/)*|||
|Storage Blob|[S3](https://aws.amazon.com/s3/pricing/)|[Block Blobs](https://azure.microsoft.com/en-au/pricing/details/storage/blobs/)|[Cloud Storage](https://cloud.google.com/storage/pricing)||

[*] Pay per execution or invocation.

## Static Documented Comparisons

### IaaS Compute Virtual Machines

Last updated: 2020-09-23

Prices are based on the following where applicable:

* Pay As You Go
* Cheapest General Purpose Machine Type
* Linux Virtual Machines
* Australian Region
* GCP reports usable rather than available RAM

|vCPU|RAM|[AWS EC2](https://aws.amazon.com/ec2/pricing/on-demand/)|Price|[Azure VM](https://azure.microsoft.com/en-au/pricing/details/virtual-machines/linux/#d-series)|Price|[GCP GCE](https://cloud.google.com/compute/all-pricing)|Price|
|-|-|-|-|-|-|-|-|
|2|8GB|t3a.large|$68.40|B2MS|$76.32|e2-standard-2|$68.45|
|4|16GB|t3a.xlarge|$136.87|B4MS|$151.92|e2-standard-4|$136.91|
|8|32GB|t3a.2xlarge|$273.74|B8MS|$303.84|e2-standard-8|$273.82|

### Functions (Lambda)

Last updated: 2020-09-23

|Metric|[AWS](https://aws.amazon.com/lambda/pricing/)|[Azure](https://azure.microsoft.com/en-au/pricing/details/functions/)|[GCP](https://cloud.google.com/functions/pricing)|
|-|-|-|-|
|Free Invocations per Month|1M|1M|2M|
|Million Invocations|$0.20|$0.275|$0.40|
|Free Compute per Month in GB-Sec|400,000|400,000|400,000|
|Million Compute GB-Sec|$16.66|$16.00|$3.50|
|Free Network Egress per Month|1GB|5GB|5GB|
|Network Egress per GB|$0.114|$0.12|$0.12|

### Global Infrastructure

Last updated: 2020-09-23

|| [AWS](https://aws.amazon.com/about-aws/global-infrastructure/) | [Azure](https://azure.microsoft.com/en-au/global-infrastructure/regions/) | [GCP](https://cloud.google.com/about/locations/) |
|---------|----|----|----|
| Regions | 24 | 57 | 24 |
| Zones   | 77 | 10 Regions with Zones | 73 |
| Edge (CDN) |216 [CloudFront](https://aws.amazon.com/cloudfront/features/)| 170 [CDN](https://docs.microsoft.com/en-us/azure/cdn/cdn-pop-locations)|144 [Edge](https://cloud.google.com/about/locations/)|

### Kubernetes

Last updated: 2020-09-23

|Component|AWS [EKS](https://aws.amazon.com/eks/pricing/)|Azure [AKS](https://azure.microsoft.com/en-au/pricing/details/kubernetes-service/)|GCP [GKE](https://cloud.google.com/kubernetes-engine/pricing)|
|-|-|-|-|
|Master|$72 per cluster|$72 SLA per cluster|$72 per cluster|
|Nodes|[EC2 Pricing](https://aws.amazon.com/ec2/pricing/on-demand/)|[VM Pricing](https://azure.microsoft.com/en-au/pricing/details/virtual-machines/series/)|[GCE Pricing](https://cloud.google.com/compute/all-pricing)|

