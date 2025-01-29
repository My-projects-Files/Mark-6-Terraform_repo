
terraform {
	required_version = ">= 1.10.3"
}

provider "aws" {
	region = "eu-north-1"
}

resource "aws_security_group" "allow_ssh" {
	name = "allow_ssh"
	description = "allow ssh access to EC2 instance"

	ingress {
	  from_port = 22
	  to_port = 22
	  protocol = "tcp"
	  cidr_blocks = ["0.0.0.0/0"] #allow ssh from any ip addr
	}
	egress {
	  from_port = 0
	  to_port = 0
	  protocol = "-1" #allow all outbound traffic
	  cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "my_instance" {
	ami = var.ami_id  #defined in var folder
	instance_type = var.instance_type #defined in var folder
	security_groups = [aws_security_group.allow_ssh.name] #reference above resource
	key_name = var.demo #make sure this key exists in your aws account
	
	tags = {
	  Name = "myEC2insatnce"
	}
}


