# aws-cloudcraft-role

Terraform Template to install cloudcraft role and policy in an AWS account, enabling CloudCraft to access that AWS account for live documentation

## How to use this Template

1. Checkout git repository
```
git clone git@iteragit.iteratec.de:DevOps/aws-cloudcraft-role.git
```

2. provide AWS credentials for the AWS provider to access the correct AWS account
- Alternative 1: use default AWS credentials defined in ~/.aws/config and ~/.aws/credentials
- Alternative 2: use specialized profile from shared credentials file in ~/.aws/config and ~/.aws/credentials
  ==> edit terraform.tfvars: set aws_profile to profile_name that should be used
  ==> enable profile setting in provider section of main.tf
- Alternative 3: use static AWS credentials in terraform.tfvars
  ==> edit terraform.tfvars: set aws_access_key and aws_secret_key
  ==> enable  aws_access_key and aws_secret_key settings in provider section of main.tf

3. Open CloudCraft (https://cloudcraft.co/app), select "AWS accounts" from CloudCraft User menu and select "ADD AWS ACCOUNT" in "Manage AWS Accounts" PopUp Layer

4. Use External ID from CloudCraft PopUp layer to specify ExternalId for CloudCraft in terraform.tfvars

5. Use Terraform to create the CloudCraft role and the corresponding role policy for cloudcraft
```
terraform init
terraform apply
```
6. Extract cloudfront_role_arn from terraform outputs as input value for Role ARN input field in CloudCraft "ADD AWS ACCOUNT" PopUp

7. Specify a meaningful name for the AWS account in CloudCraft PopUp and Save the AWS Account infos in cloudcraft
