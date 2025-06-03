
terraform {
	required_version = ">= 1.10.3"
}

provider "aws" {
	region = "eu-north-1"
}

module "allow_ssh" {
	source = "../modules/security_group"
	ing_from_val = 22
	ing_to_val= 22
	ing_protocol_val="tcp"
	ing_cidr_val= ["0.0.0.0/0"]
	sg_name = "ssh_security_group"

}

module "my_instance" {
	source = "../modules/ec2_instance"
	ami_id_val= var.ami_id
	instance_type_val= var.instance_type
	sg_val = [module.allow_ssh.sg_name]
	tag_name= var.tag_name
}


