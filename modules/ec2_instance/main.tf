provider "aws" {
        region = "eu-north-1"
}

resource "aws_instance" "my_instance" {
        ami = var.ami_id_val  
        instance_type = var.instance_type_val

        tags = {
          Name = "var.tag_name"
        }
}

