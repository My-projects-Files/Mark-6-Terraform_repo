terraform{

provider "aws" {
	region = var.aws_region
}

resource "aws_dynamodb" "data_table" {
	name = "json-data-format"
	billing_mode = "PAY_PER_REQUEST"
	hash_key = "id"

	attribute {
		name = "id"
		type = "S"
	}
}

resource "aws_s3_bucket" "my-terra-bucket" {
	bucket = var.s3_bucket

	versioning {
		enabled = true
	}
}

resource "aws_iam_role" "lambda_role" {
	name = "lambda_role"
	

}
