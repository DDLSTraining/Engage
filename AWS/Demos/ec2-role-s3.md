# Demonstration EC2 Role S3

This demonstrations shows the use of IAM Roles to enable an EC2 instance to have Read Only access to an S3 Bucket.

## Steps

1. Create a new `key-pair` for SSH access if one does not already exist.
1. Create an S3 Bucket:
   * Use the default configuration with no public access and only owner permissions.
1. Upload a file to the new Bucket:
   * Again, use the default permissions with only owner access.
   * Remember the Bucket name, directory name if created, and the file name.
1. Create a new IAM Role:
   * Type: `AWS Service`
   * Service: `EC2`
   * Attach permission policy: `AmazonS3ReadOnlyAccess`
   * Role name: `iam-role-ec2-read-only-access`
1. Create a new EC2 instance:
   * AMI: Default `Amazon Linux 2` (this image supports the AWS CLI)
   * IAM role: `iam-role-ec2-read-only-access`
   * Shutdown behavior: `Terminate`
   * Security group: `default` or one that enables SSH access.
1. Wait for the new EC2 instance to start.
1. SSH into the Public IP address of the new instance.
1. Run the following command to download the file from S3 using the IAM Role:
   * `aws s3 cp s3://[bucket name]/[directory if created]/[file name with extension]`
   * The file should successfully download onto the EC2 instance.
1. Run the `ls -l` command to see the file.
