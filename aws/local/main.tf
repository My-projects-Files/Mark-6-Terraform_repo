
#we will start with terraform block
#we can specify single or multiple providers

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
     }
    }
   
	required_version = "

#configuring the aws provider
Provider "aws" {
   region = "us-east-1"
}

#create ec2 instance

resource "aws_instance" "app_server" {
  ami         = "
