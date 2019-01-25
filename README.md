# aws-cloudcraft-role

Terraform and CloudFormation Template to install cloudcraft role and policy in an AWS account, enabling CloudCraft to access that AWS account for live documentation

## Prepare to use these Templates

1. Checkout git repository
```
git clone git@iteragit.iteratec.de:DevOps/aws-cloudcraft-role.git
cd aws-cloudcraft-role
```

## How to use the Terraform Template
1. switch to terraform directory
```
cd Terraform
```

2. provide AWS credentials for the AWS provider to access the correct AWS account
- Alternative 0: use AWS environment settings
- Alternative 1: use default AWS credentials defined in ~/.aws/config and ~/.aws/credentials
- Alternative 2: use specialized profile from shared credentials file in ~/.aws/config and ~/.aws/credentials
  ==> edit terraform.tfvars: set aws_profile to profile_name that should be used
  ==> enable profile setting in provider section of main.tf
- Alternative 3: use static AWS credentials in terraform.tfvars
  ==> edit terraform.tfvars: set aws_access_key and aws_secret_key
  ==> enable  aws_access_key and aws_secret_key settings in provider section of main.tf

3. Provide a meaningful name for the used AWS ACCOUNT
- edit terraform.tfvars: set aws_account_alias = "..."

4. Use Terraform to create the CloudCraft role and the corresponding role policy for cloudcraft
```
terraform init
terraform apply -auto-approve
```
6. Send terraform outputs to Architecture Review Team
```
terraform output
```
