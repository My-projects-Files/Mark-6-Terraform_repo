variable "sg_name" {
	description = "name of the security group"
}

variable "ing_from_val" {
	type = number
	description = "Ingress from port"
}

variable "ing_to_val" {
	type = number
	description = "Ingress to port"
}

variable "ing_protocol_val" {
	description = "Ingress protocol"
}

variable "ing_cidr_val" {
	description = "ingress CIDR blocks"
}

variable "egr_from_val" {
	type = number
	default = 0
	description = "egress from port"
}

variable "egr_to_val" {
	type = number
	default = 0
	description = "egress to port"
}

variable "egr_protocol_val" {
	default = "-1"
	description = "All outbound traffic allowed"
}

variable "egr_cidr_val" {
	default = ["0.0.0.0/0"]
	description = "egress CIDR blocks"
}
