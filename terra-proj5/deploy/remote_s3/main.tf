terraform {
	required_version= ">= 1.10.3"
}

provider "aws"{}

resource "aws_s3_bucket" "terraform_state" {
	bucket = "test-s3-native-lock-12"


