terraform {
	required_version= ">= 1.10.3"
}

provider "aws"{
	region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
	bucket = "test-s3-native-lock-12"
	tags = {
        name = "terraorm state storage"
        Environment = "Prd"
	}
}

resource "aws_s3_bucket_versioning" "versioning" {
	bucket = aws_s3_bucket.terraform_state.id
	
	versioning_configuration {
	status = "Enabled"
	}
}	
	
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
	bucket = aws_s3_bucket.terraform_state.id

	rule {
		apply_server_side_encryption_by_default {
			sse_algorithm = "AES256"
	}
    }
}

