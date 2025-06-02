variable "ami_id" { 
        description = "AMI id to use for the instance"
}

variable "instance_type" {
        description = "the type of instance creat"
}

variable "demo" {
        description = "ssh key pair name for instance"
}

variable "tag_name" {
	description = "The name of the instance"
}
