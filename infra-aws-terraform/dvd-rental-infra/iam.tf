# IAM policy for Snowflake to access S3 bucket
resource "aws_iam_policy" "snowflake_s3_policy" {
  name        = "snowflake-s3-dvd-rental-policy"
  description = "Policy for Snowflake to access S3 bucket for DVD rental data"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion"
        ]
        Resource = "arn:aws:s3:::${var.bucket_name}/${var.s3_prefix}*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ]
        Resource = "arn:aws:s3:::${var.bucket_name}"
        Condition = {
          StringLike = {
            "s3:prefix" = ["${var.s3_prefix}*"]
          }
        }
      }
    ]
  })
}

# IAM role for Snowflake (initial creation without trust policy)
resource "aws_iam_role" "snowflake_role" {
  name = "snowflake-s3-dvd-rental-role"

  # Temporary trust policy - will be updated after getting Snowflake external ID
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.aws_account_id}:root"  # Placeholder
        }
        Action = "sts:AssumeRole"
        Condition = {
          StringEquals = {
            "sts:ExternalId" = "placeholder"
          }
        }
      }
    ]
  })
}

# Attach policy to role
resource "aws_iam_role_policy_attachment" "snowflake_policy_attachment" {
  role       = aws_iam_role.snowflake_role.name
  policy_arn = aws_iam_policy.snowflake_s3_policy.arn
}

# Output the role ARN for Snowflake integration
output "snowflake_role_arn" {
  value       = aws_iam_role.snowflake_role.arn
  description = "ARN of the IAM role for Snowflake"
}