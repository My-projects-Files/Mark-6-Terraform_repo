
variable "environment" {
	description = "Deployment env"
	type 	= 	string
	default = "dev"
}

variable "s3_get" {
	description = "resource for the s3 bucket"
	type = string
	default = "arn:aws:s3:::my-terra-data-upload/*"
}

variable "dynamodb" {
	description = "dynamodb resource details"
	type = string
	default = "arn:aws:dynamodb:us-east-1:906502061897:table/LambdaS3dynamo"
}

