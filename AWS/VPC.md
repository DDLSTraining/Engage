# AWS Virtual Private Cloud (VPC)

* [A Day in the Life of a Billion Packets (CPN401) | AWS re:Invent 2013](https://www.youtube.com/watch?v=Zd5hsL-JNY4)

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

### Elastic Load Balancer (ELB)

Three types; Application, Network, and Classic Load Balancer.

* Scope: Region
* Elastic
* Highly Available
* Fault Tolerant

### Flow Logs

[VPC Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html) is a feature that enables you to capture information about the IP traffic going to and from network interfaces in your VPC. Flow log data can be published to Amazon CloudWatch Logs and Amazon S3. After you've created a flow log, you can retrieve and view its data in the chosen destination. 
