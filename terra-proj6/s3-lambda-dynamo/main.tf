terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}

# dynamodb table creation
resource "aws_dynamodb_table" "data_table" {
  name         = "json-data-format"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

# s3 bucket creation
resource "aws_s3_bucket" "my-terra-bucket" {
  bucket = "my-terra-data-upload"

}

# enabling versioning on s3

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my-terra-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# lambda default role creation
resource "aws_iam_role" "lambda_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# attach the role to lambda
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = var.lambda_basic_arn
}

# create a custome aws policy for getting access to the s3,dynamodb

resource "aws_iam_policy" "lambda_dynamodb_s3_access" {
  name        = "lambda_dynamodb_s3_access"
  description = "Policy for lambda to access s3 and dynamo"

  policy = jsonencode({


    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "s3:GetObject",
        "Resource" : var.s3_arn
      },
      {
        "Effect" : "Allow"
        "Action" : "dynamodb:PutItem",
        "Resource" : var.dynamo_arn
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]

  })
}

# add the custome policy to the above role
resource "aws_iam_policy_attachment" "custom_policy_attach" {
  name       = "attach_custom_policy"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = aws_iam_policy.lambda_dynamodb_s3_access.arn
}
# ziping the lambda file

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_funtion.py"
  output_path = "${path.module}/lambda_funtion.zip"
}

# To create a lambda funtion

resource "aws_lambda_function" "s3_to_dynamo" {
  function_name    = "S3toDynamoLambda"
  role             = aws_iam_role.lambda_role.arn    # attach iam role
  handler          = "lambda_funtion.lambda_handler" #provide file name and what to trigger in it
  runtime          = "python3.9"
  filename         = data.archive_file.lambda_zip.output_path         # file path from the zip file
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256 #used to store hash value of file to find changes to file
  timeout          = 10
}


# Allowing s3 for lambda function invoke

resource "aws_lambda_permission" "allow_s3_invoke" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_to_dynamo.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.my-terra-bucket.arn
}

# S3 bucket notification to trigger lambda on file upload

resource "aws_s3_bucket_notification" "s3_notify_lambda" {
  bucket = aws_s3_bucket.my-terra-bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.s3_to_dynamo.arn
    events              = ["s3:ObjectCreated:*"] #Trigger on any object
    filter_suffix       = trimspace(".json")

  }


  # permission needs to be created before adding the dependencies
  depends_on = [aws_lambda_permission.allow_s3_invoke]
}
