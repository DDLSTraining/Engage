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

### Articles

* 2018-12-14 - [Cockroach Labs - 2018 Cloud Report](https://www.cockroachlabs.com/blog/2018_cloud_report/) - AWS Outperforms GCP
  * 2018-12-14 - [Hacker News Related Thread](https://news.ycombinator.com/item?id=18673541)
* 2018-06-06 - [Public Cloud Object-store Performance is Very Unequal across AWS S3, Google Cloud Storage, and Azure Blob Storage](https://dev.to/sachinkagarwal/public-cloud-object-store-performance-is-very-unequal-across-aws-s3-google-cloud-storage-and-azure-blob-storage-13do)
* 2015-12-29 - [AWS S3 vs GCS vs Azure Storage](http://blog.zachbjornson.com/2015/12/29/cloud-storage-performance.html)

## Functions (Lambda)

Last updated: 2019-02-16

_Note: Prices are USD_

| Platform | Free Inv | Invocations | Free Compute | Compute | Free Network | Network |
|-|-|-|-|-|-|-|
| AWS | 1M | $0.20 per 1M | 400,000 GB-s | $0.00001667 GB-s | 1GB | $0.09 per GB |
| Azure | 1M | $0.275 per 1M | 400,000 GB-s | $0.000022 per GB-s | 5GB | $0.165 per GB |
| GCP | 2M | $0.40 per 1M | 1M GB-s | $0.0000025 per GB-s | 5GB | $0.12 per GB |

## Regions

Last updated: 2018-09-17

|| [AWS](https://aws.amazon.com/about-aws/global-infrastructure/) | [Azure](https://azure.microsoft.com/en-au/global-infrastructure/regions/) | [GCP](https://cloud.google.com/about/locations/) |
|---------|----|----|----|
| Regions | 18 | 54 | 17 |
| Zones   | 55 |    | 52 |

