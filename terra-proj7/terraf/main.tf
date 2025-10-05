terraform {
   required_providers {
	aws = {
	    source = "hashicorp/aws"
	    version = "5.28.0"
	}
	vault = {
	   source = "hashicorp/vault"
	   version = "3.20.0"
	}
    }
}

provider "vault" {
	address = "http://127.0.0.1:8200"
	token = var.vault_token
}

data "vault_aws_access_credentials" "creds" {
	backend = "aws"
	role   = "terraform-role"
}

provider "aws" {
	region = "us-east-1"
	access_key = data.vault_aws_access_credentials.creds.access_key
	secret_key = data.vault_aws_access_credentials.creds.secret_key
}

resource "aws_instance" "demo" {
	ami           = "ami-0360c520857e3138f"
 	instance_type = "t2.micro"

  	tags = {
    		Name = "VaultTerraformDemo"
  	}
}
