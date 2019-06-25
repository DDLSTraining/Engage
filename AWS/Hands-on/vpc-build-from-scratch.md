# VPC from Scratch

This exercise will walk you though manually creating all the resources to publish a web server on an EC2 instance.

The following resources are created:

* VPC
* Subnet
* Internet Gateway
* Route Table
* Network ACL
* Security Group
* Network Interface
* Elastic IP
* EC2 Instance

## Steps

1. In VPC, create a new VPC:
   * Do not use the Launch Wizard.
   * Name: `scratch-vpc`
   * IPv4 CIDR Block: `10.0.0.0/16`
1. Create a new Subnet:
   * Place inside the `scratch-vpc`.
   * Name: `scratch-igw`
   * IPv4 CIDR Block: `10.0.0.0/24`
1. Create an Internet Gateway:
   * Name: `scratch-igw`
1. Select the `scratch-igw` and attach to the `scratch-vpc`.
1. Create a Route Table:
   * Name: `scratch-route-table`
   * Attach to the `scratch-vpc`.
1. Select the `scratch-route-table` and edit the routes:
   * Add a new route.
   * Destination: `0.0.0.0/0`
   * Target: `igw` named `scratch-igw`
1. Set `scratch-route-table` as the Main route table for the `scratch-vpc`.
1. Create a Network ACL:
   * Name: `scratch-nacl`
   * Attach to the `scratch-vpc`.
1. Select the `scratch-nacl` and edit the following:
   * Three new Inbound Rules:
     1. First Rule:
        * Rule #: 100
        * Type: HTTP (80)
     1. Second rule:
        * Rule #: 200
        * Type: SSH (22)
     1. Third Rule:
        * Used for package installation (client ports)
        * Rule #: 300
        * Type: Custom TCP
        * Port Range: 32768-65535
   * One new Outbound Rule:
     * Rule #: 1000
     * Type: All Traffic
   * Edit subnet associations and associate with the `scratch-subnet`.
1. Create a new Security Group:
   * Name: `scratch-security-group`
   * Description: Security group for VPC from scratch.
   * Attach to the VPC `scratch-vpc`.
1. Select the `scratch-security-group` and add two new Inbound Rules:
   1. First Rule:
      * Type: SSH
      * Source: Anywhere
   1. Second Rule:
      * Type: HTTP
      * Source: Anywhere
1. In EC2, Create a Network Interface:
   * Description: Scratch network interface.
   * Subnet: `scratch-subnet`
   * IPv4 Address: Custom `10.0.0.100`
   * Security Group: `scratch-security-group`
1. Edit the Name of the new Network Interface:
   * Name: `scratch-network-interface`
1. In VPC, allocate an Elastic IP.
1. Edit the Name of the new Elastic IP:
   * Name: `scratch-elastic-ip`
1. Select the new Elastic IP and Allocate Address:
   * Type: Network Interface
   * Network Interface: `scratch-network-interface`
   * Private IP: `10.0.0.100`
1. In EC2, create a new EC2 instance:
   * AMI: Use the default Amazon Linux.
   * Size: Use the default t2.micro.
   * Network: `scratch-vpc`
   * Subnet: `scratch-subnet`
   * Network Interface: `scratch-network-interface`
   * Add tag Name: `scratch-instance`
   * Security Group: Existing `scratch-security-group`
   * Advanced User Data: See below.
   * Key Pair: Use your own key pair.
1. Wait for the instance to finish starting and configuring.
1. Select the `scratch-instance` and copy the Public IP Address.
1. Open a browser and paste in the Public IP Address.
1. You should see the apache test page.
1. Add `phpinfo.php` on to the addres and you should see the PHP Info page.

Use the below script for your User Data in the EC2 Instance:

```bash
#!/bin/bash
yum update -y
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd mariadb-server
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
```
