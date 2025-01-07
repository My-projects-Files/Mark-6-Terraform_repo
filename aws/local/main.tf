
#we will start with terraform block
#we can specify single or multiple providers

terraform {
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




