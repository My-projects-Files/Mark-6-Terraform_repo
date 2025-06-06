resource "aws_security_group" "allow_ssh" {
	name = var.sg_name
	description = var.des_val

	ingress {
	  from_port = var.ing_from_val
	  to_port = var.ing_to_val
	  protocol = var.ing_protocol_val
	  cidr_blocks = var.ing_cidr_val
	}
	egress {
	  from_port = var.egr_from_val
	  to_port = var.egr_to_val
	  protocol = var.egr_protocol_val
	  cidr_blocks = var.ing_cidr_val
	}
	
	tags = var.tags
}
