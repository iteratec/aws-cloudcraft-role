# Configure the AWS Provider

provider "aws" {
  region = "${var.aws_region}"

  #  profile = "${var.aws_profile}"

  #  access_key = "${var.aws_access_key}"
  #  secret_key = "${var.aws_secret_key}"
}

resource "aws_iam_role" "cloudcraft_role" {
  name = "cloudcraft_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::968898580625:root"
      },
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "${var.cloudcraft_externalID}"
        }
      }
    }
  ]
}
EOF

  tags = {
    ExternalUser = "CloudCraft"
  }
}

resource "aws_iam_role_policy" "cloudcraft_role_policy" {
  name = "cloudcraft_role_policy"
  role = "${aws_iam_role.cloudcraft_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "apigateway:Get",
        "application-autoscaling:Describe*",
        "autoscaling-plans:Describe*",
        "athena:List*",
        "athena:Batch*",
        "athena:Get*",
        "autoscaling:Describe*",
        "batch:List*",
        "batch:Describe*",
        "cloudfront:Get*",
        "cloudfront:List*",
        "cloudtrail:Describe*",
        "cloudtrail:Get*",
        "cloudtrail:List*",
        "cloudwatch:Describe*",
        "cloudwatch:Get*",
        "cloudwatch:List*",
        "config:Deliver*",
        "config:Describe*",
        "config:Get*",
        "config:List*",
        "datapipeline:Describe*",
        "datapipeline:EvaluateExpression",
        "datapipeline:Get*",
        "datapipeline:List*",
        "datapipeline:QueryObjects",
        "datapipeline:Validate*",
        "dynamodb:DescribeTable",
        "dynamodb:ListTables",
        "dynamodb:ListTagsOfResource",
        "ec2:Describe*",
        "elasticache:Describe*",
        "elasticache:List*",
        "elasticfilesystem:Describe*",
        "elasticloadbalancing:Describe*",
        "emr:Describe*",
        "emr:List*",
        "es:Describe*",
        "es:List*",
        "kinesis:Describe*",
        "kinesis:List*",
        "lambda:List*",
        "rds:Describe*",
        "rds:ListTagsForResource",
        "redshift:Describe*",
        "route53:Get*",
        "route53:List*",
        "route53domains:Check*",
        "route53domains:Get*",
        "route53domains:List*",
        "route53domains:View*",
        "s3:GetBucketAcl",
        "s3:GetBucketLocation",
        "s3:GetBucketNotification",
        "s3:GetBucketTagging",
        "s3:GetEncryptionConfiguration",
        "s3:List*",
        "serverlessrepo:List*",
        "serverlessrepo:Get*",
        "serverlessrepo:SearchApplications",
        "servicecatalog:List*",
        "servicecatalog:Scan*",
        "servicecatalog:Search*",
        "servicecatalog:Describe*",
        "servicediscovery:Get*",
        "servicediscovery:List*",
        "ses:Get*",
        "ses:List*",
        "sns:GetTopicAttributes",
        "sns:List*",
        "sqs:GetQueueAttributes",
        "sqs:List*",
        "tag:Get*",
        "waf:Get*",
        "waf:List*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
