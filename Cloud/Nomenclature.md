# Cloud Nomenclature or Naming Convention / Standard

> [Nomenclature](https://www.merriam-webster.com/dictionary/nomenclature?pronunciation&lang=en_us&dir=n&file=nomenc03): a system or set of terms or symbols especially in a particular science, discipline, or art. Nomenclature comes from the Latin nomenclatura, meaning "the assigning of names".

This document can be used to help you design a naming standard or nomenclature for cloud based resources such as virtual machine instances or messaging queues.

Whatever you decide to do, the most important thing to keep in mind when naming resources in the cloud is to maintain a consistent naming convention.

## Definitions

* [Taxonomy](https://en.wikipedia.org/wiki/Taxonomy_(general)):
  * The practice and science of classification.
* [Camel Case](https://en.wikipedia.org/wiki/Camel_case):
  * The practice of writing phrases such that each word or abbreviation in the middle of the phrase begins with a capital letter, with no intervening spaces or punctuation.
  * Example: `theQuickBrownFoxJumpsOverTheLazyDog`
* [Kebab Case](https://en.wikipedia.org/wiki/Kebab_case):
  * Punctuation is removed and spaces are replaced by single hyphens. Normally the letters share the same case.
  * Example: `the-quick-brown-fox-jumps-over-the-lazy-dog`

## References

* [Azure Naming Conventions](https://docs.microsoft.com/en-us/azure/architecture/best-practices/naming-conventions)
* [AWS Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/)
* [RightScale - Tagging Best Practices for Cloud Governance and Cost Management](https://blogs.flexera.com/cloud/enterprise-cloud-strategies/tagging-best-practices-for-cloud-governance-and-cost-management/)
* [A guide to tagging resources in AWS](https://medium.com/stax-blog/a-guide-to-tagging-resources-in-aws-8f4311afeb46)
* Reddit:
  * [Cloud Resource Naming Conventions](https://www.reddit.com/r/aws/comments/6rkczi/best_practices_for_naming_conventions/)
  * [Best Practices for Naming Conventions](https://www.reddit.com/r/aws/comments/6rkczi/best_practices_for_naming_conventions/)
  * [How do you decide on your server naming convention?](https://www.reddit.com/r/sysadmin/comments/6r00ko/how_do_you_decide_on_your_server_naming_convention/)

## Cross-Cloud Naming Standard (BETA)

Following is a naming convention used by Grant Carthew. Grant works in AWS, Azure, and GCP and as such has adopted this naming standard to be cross-cloud compatible.

### Descriptive Names

Ensure you make your resource names as long as you can with as much detail in the name. Consider a virtual machine instance with these properties:

* Region: `australia-southeast`
* OS: `Debian GNU/Linux`
* Installed dependencies: `nginx`
* Application: `shop`
* Function: `orders web endpoint`

A good name for this instance would be:

`instance-linux-debian-au-se-web-shop-nginx-orders`

### Lower Kebab Case

Only ever use lower kebab case names. In most cases the names used for resources are case sensitive. By using a convention of lower kebab case names your resource management will be simplified.

This doesn't always work. For example the standard `Name` tag in AWS starts with a capitol letter. That doesn't mean you can't use lower kebab case for the resource name however the tag key will be `Name`.

### Name Part Ranking

All names should have multiple parts such as `instance-linux-debian-au-se-web-shop-nginx-orders`. These parts should be in order from the largest object or system down to the smallest.

This is the hardest part to manage because it is so easy to have people in different teams rank the parts differently.

What you concider to be a large system is up to you. For example you may want to start your names with the type of resource:

`instance-linux-debian-au-se-web-shop-nginx-orders`

Or you may want the application name at the start:

`shop-instance-linux-debian-au-se-web-nginx-orders`

Or even the application and function at the start:

`show-web-orders-instance-linux-debian-au-se` (no dependency of nginx)

Lastly, you may consider the region details to be of upmost importance:

`au-se-instance-linux-debian-shop-web-orders` (again, no dependency of nginx)

### Tagging

All cloud providers support some sort of resource taxonomy or classification. You should be liberal with tags however stick with lower kebab case keys and values where possible.




