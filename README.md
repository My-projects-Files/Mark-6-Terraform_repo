# Mark-6-Terraform. Contributions are welcome.
This is to understand terraform
## To update to latest veersion of terraform we need to install tfenv. we run this if the alredy installed and in old version.
~~~
# To install tfenv in linux
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# To update terraform to latest version
tfenv install latest
tfenv use latest
~~~
 
## Project-1 
we are creating a aws instance using terraform (local file),in this our state file is stored in locally
So we have to store them remotely(remote file) which is a best practice. so we will create S3 bucket (to store the state file) and dynamicdb (state lock)
we will link the back end to local file so state file of instance will be stored in s3 bucket


## Project-2

### Provision an AWS EC2 Instance with Terraform
In this project, you will use Terraform to create an EC2 instance on AWS, configure a security group to allow SSH access, and define all resources through Terraform code.

### Project Requirements
### EC2 Instance:

Launch an EC2 instance with a specific Amazon Machine Image (AMI) and instance type.

### Security Group:

Create a security group to allow incoming SSH traffic (port 22) to the EC2 instance.
### Key Pair:

Use an SSH key pair to access the EC2 instance once it is provisioned.
### Terraform Automation:

All the infrastructure will be managed using Terraform to ensure repeatability and version control.

Note: we need to create ssh keypair in aws, and make sure if you have proper region and relavent api mentioned.

## reference doc
~~~
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

https://developer.hashicorp.com/terraform/language/import
~~~

## Project-3
### Configure the RDS along with VPC and subnet

We are configuring the vpc and subnets if we dont have them, then we are creating the db subnet group using which we are creating the DB instance.

## New state lock feature in terraform
Old Setup – S3 + DynamoDB

### Earlier, we had to use:

S3 bucket to store the Terraform state file

DynamoDB table to handle locking (to avoid two people making changes at the same time)

### New Update – Native S3 Locking (Terraform 1.10+)

Now with Terraform 1.10 and above, AWS S3 itself supports locking, no need for DynamoDB table.

Just enable versioning in the S3 bucket and add one line in your Terraform backend config.

~~~
terraform {
 backend "s3" {
 bucket = "your-terraform-state-bucket"
 key = "path/to/your/statefile.tfstate"
 region = "ap-south-1"
 encrypt = true
 use_lockfile = true # This enables native locking
 }
}
~~~

## Vault – Identity-Based Secrets Management
HashiCorp Vault is a secrets management tool that securely stores and controls access to sensitive data like API keys, passwords, certificates, and database credentials. It also supports identity-based access and dynamic secrets.
