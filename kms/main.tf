data "aws_caller_identity" "current" {}
resource "aws_kms_key" "kmsmasterkey" {
  description = "This KMS key is used encrypt all the resource in the aws account"
  is_enabled          = true
  enable_key_rotation = true
  policy = <<POLICIES
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "kms:*",
            "Principal": {"AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"},
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
POLICIES
  tags = {
    Env = "var.environment"
  }
}
resource "aws_kms_alias" "kmsmasterkey" {
  name          = "alias/${var.kms_alias_name}"
  target_key_id = aws_kms_key.kmsmasterkey.key_id
}
