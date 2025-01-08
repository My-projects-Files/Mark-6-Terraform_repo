### we are creating S3 buckets and Dynamic Db tables for back end of state file storage ###


## to specify the terraform version ##

terraform {
  required_version = ">= 1.10.3"
}


## to configure AWS connection ##
provider "aws" {}

## to create S3 buckets ##

data "aws_caller_identity" "current" {}

locals {
  account_id    = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket" "terraform_state" {
#With account id, this S3 bucket names can be *globally* unique.#
  bucket = "${local.account_id}-terraform-states"

# Enable versioning so we can see the full revision history of our state files#
  versioning {
    enabled = true
  }

# Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

## To create Dynamic Table ##

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
