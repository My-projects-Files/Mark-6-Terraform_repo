variable "instance_type" {
	description = "the type of instance creat"
	default = "t3.micro"
}

variable "ami_id" {
	description = "AMI id to use for the instance"
	default = "ami-09a9858973b288bdd"
}

variable "demo" {
	description = "ssh key pair name for instance"
	default = "demo"
}

variable "tag_name" {
	description = "name of the instance"
	default = "myEC2insatnce"
}
