resource "aws_iam_role" "lambda_role" {
  name = "${var.environment}-lambda-role"

  assume_role_policy = jsonencode({

  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": var.s3_get
    },
    {
      "Effect": "Allow",
      "Action": "dynamodb:PutItem",
      "Resource": var.dynamodb
    },
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
})

  tags = {
    Name = "${var.environment}-lambda-role"
  }
}

