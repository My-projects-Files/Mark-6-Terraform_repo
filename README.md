# Mark-6
This is to understand terraform

# Project-1 
we are creating a aws instance using terraform (local file),in this our state file is stored in locally
So we have to store them remotely(remote file) which is a best practice. so we will create S3 bucket (to store the state file) and dynamicdb (state lock)
we will link the back end to local file so state file of instance will be stored in s3 bucket


# Project-2

## Provision an AWS EC2 Instance with Terraform
In this project, you will use Terraform to create an EC2 instance on AWS, configure a security group to allow SSH access, and define all resources through Terraform code.

## Project Requirements
### EC2 Instance:

Launch an EC2 instance with a specific Amazon Machine Image (AMI) and instance type.

### Security Group:

Create a security group to allow incoming SSH traffic (port 22) to the EC2 instance.
### Key Pair:

Use an SSH key pair to access the EC2 instance once it is provisioned.
### Terraform Automation:

All the infrastructure will be managed using Terraform to ensure repeatability and version control.

Note: we need to create ssh keypair in aws, and make sure if you have proper region and relavent api mentioned.

# reference doc
~~~
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

https://developer.hashicorp.com/terraform/language/import
~~~
