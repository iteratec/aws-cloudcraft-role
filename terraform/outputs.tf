output "cloudfront_role_arn" {
  value = "${aws_iam_role.cloudcraft_role.arn}"
}

output "aws_account_alias" {
  value = "${var.aws_account_alias}"
}
