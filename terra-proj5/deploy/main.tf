terraform {
	required_version = ">=1.10.3"
	
	backend "s3" {
        	bucket = "test-s3-native-lock-12"
        	key    = "global/terraform.tfstate"
        	encrypt= true
        	region = "us-east-1"
        	use_lockfile = true
	}
}

provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "test_server"{
	ami  = "ami-0953476d60561c955"
	instance_type= "t2.micro"
	tags = {
		name= "EC2 with remote state and s3 statelock"
	}
}


