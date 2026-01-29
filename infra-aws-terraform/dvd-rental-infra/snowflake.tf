# Snowflake storage integration
resource "snowflake_storage_integration" "s3_integration" {
  name    = var.integration_name
  type    = "EXTERNAL_STAGE"
  enabled = true

  storage_provider         = "S3"
  storage_aws_role_arn     = aws_iam_role.snowflake_role.arn
  storage_allowed_locations = ["s3://${var.bucket_name}/${var.s3_prefix}"]

  depends_on = [
    aws_iam_role_policy_attachment.snowflake_policy_attachment
  ]
}

# Output Snowflake integration details
output "snowflake_external_id" {
  value       = snowflake_storage_integration.s3_integration.storage_aws_external_id
  description = "Snowflake external ID for AWS trust policy"
  sensitive   = true
}

output "snowflake_user_arn" {
  value       = snowflake_storage_integration.s3_integration.storage_aws_iam_user_arn
  description = "Snowflake IAM user ARN for AWS trust policy"
}