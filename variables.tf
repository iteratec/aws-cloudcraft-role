variable "aws_account_alias" {
  description = "meaningful alias name for the AWS account"
  default     = "to be defined"
}

variable "aws_region" {
  description = "The AWS region."
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "name of aws profile to use"
  default     = "iterashift"
}

variable "aws_access_key" {
  description = "AWS access key to use"
  default     = ""
}

variable "aws_secret_key" {
  description = "AWS secret key to use"
  default     = ""
}

variable "cloudcraft_externalID" {
  description = "external ID"
  default     = "badf895d-4c55-47db-81ba-cf6d9e16f97f"
}
