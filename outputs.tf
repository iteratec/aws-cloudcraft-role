output "cloudfront_role_arn" {
  value = "${aws_iam_role.cloudcraft_role.arn}"
}
