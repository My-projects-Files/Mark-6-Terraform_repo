variable "lambda_basic_arn" {
	description = " this is the arn for the basic lambda role"
	type = string
	default = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

}

variable "s3_arn" {
	description = "This is the arn for the created s3 bucket"
	type = string
	default = "arn:aws:s3:::my-terra-data-upload/*"
}

variable "dynamo_arn" {
	description = "This is arn for the dynamodb"
	type = string
	default = "arn:aws:dynamodb:us-east-1:906502061897:table/json-data-format"
}

variable "aws_region" {
	description = "this is region details of the resource in aws"
	type = string
	default = "us-east-1"
}
