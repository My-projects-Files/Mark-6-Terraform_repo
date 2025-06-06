variable "vpc_cidr" {
	default = "10.0.0.0/16"
	description = "cidr value of vpc"
}

variable "subnet_1_cidr" {
	default = "10.0.1.0/24"
	description = "cidr value for the vpc subnet_1"
}

variable "subnet_1_az" {
	default = "us-east-1a"
	description = "az for the subnet_1"
}

variable "subnet_2_cidr" {
        default = "10.0.2.0/24"
        description = "cidr value for the vpc subnet_2"
}

variable "subnet_2_az" {
        default = "us-east-1b"
        description = "az for the subnet_2"
}

variable "vpc_tag" {
	default = "Main_vpc"
	description = "name of the vpc"
}

variable "subnet_1_tag" {
	default = "subnet 1"
	description = "subnet_1 tag value"
}

variable "subnet_2_tag" {
	default = "subnet 2"
	description = "subnet_2 tag value"
}

