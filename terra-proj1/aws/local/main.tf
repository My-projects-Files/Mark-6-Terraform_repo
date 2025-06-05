
#we will start with terraform block
#we can specify single or multiple providers

terraform {
  
  backend "s3" {
	bucket   = "677276120252-terraform-states" #name of the S3 created
	key      = "global/terraform.tfstate" #where the state is stored in S3
	encrypt  = true
	region   = "us-east-1"
	dynamodb_table = "terraform-lock" #name of the dynamic table created
	}	

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
     }
    }
   
	required_version = ">= 1.10.3"
}

#configuring the aws provider
  provider "aws" {
    region = "us-east-1"
}

#create ec2 instance

  resource "aws_instance" "app_server" {
    ami           = "${var.ami_var}"
    instance_type = "t2.micro"
   
     tags = {
 	Name = "Terraform_Demo"
     }
  }

#to forward the state file to S3 with dynamic db lock




