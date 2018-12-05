# AWS Virtual Private Cloud (VPC)

## VPC Components and Services

### Internet Gateway (IGW)

Connects VPC resources (EC2 instances) to the internet.

* Scope: Region
* Hightly Available
* Elastic
* Fault Tolerance
* Cost Effective

### Virtual Private Gateway (VGW)

IPSec tunnel endpoint located in AWS connected to the VPC.

* Scope: Region
* Highly Available
* Elastic
* Fault Tolerance

### Direct Connect (DX)

Dedicated network connection over private lines.

Typically enabled from within a hosting company to AWS.

### VPC Endpoints

Privately connect your EC2 instances to services outside your VPC without leaving AWS.

There are two types of VPC Endpoints; Interface Endpoint and Gateway Endpoint.

