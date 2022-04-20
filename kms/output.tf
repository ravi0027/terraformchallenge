output "kms_key_arn" {
  value       = aws_kms_key.kmsmasterkey.arn
  description = "Key ARN."
}
output "kms_key_id" {
  value       = aws_kms_key.kmsmasterkey.key_id
  description = "Key ID."
}
output "kms_alias_arn" {
  value       = aws_kms_alias.kmsmasterkey.arn
  description = "Alias ARN."
}
output "kms_alias_name" {
  value       = aws_kms_alias.kmsmasterkey.name
  description = "Alias name."
}