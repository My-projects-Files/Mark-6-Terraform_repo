#!/bin/bash


#Enable secrets engine by aws
vault secrets enable -path=aws aws

#Configure the aws access and secret keys

vault write aws/config/root \
	access_key=$AWS_ACCESS_KEY_ID \
	secret_key=$AWS_SECRET_ACCESS_KEY\
	region=us-east-1

#To create a vault role

vault write aws/roles/terraform-role \
	credential_type=iam_user \
	policy_document=- <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
	{
	 "Effect" : "Allow",
	 "Action" : [
	   "ec2:*",
	   "iam:GetUser"
	  ],
	 "Resource" : "*"
	}
    ]
}
EOF
