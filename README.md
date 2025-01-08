# Mark-6
This is to understand terraform

## Project overview
we are creating a aws instance using terraform (local file),in this our state file is stored in locally
So we have to store them remotely(remote file) which is a best practice. so we will create S3 bucket (to store the state file) and dynamicdb (state lock)

we will link the back end to local file so state file of instance will be stored in s3 bucket

### reference doc
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
https://developer.hashicorp.com/terraform/language/import
