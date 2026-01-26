resource "aws_s3_object" "data_folder" {
  bucket = var.bucket_name
  key    = "data/"
}

# Upload CSV files to S3 bucket
resource "aws_s3_object" "csv_uploads" {
  for_each = toset(local.csv_files)

  bucket = var.bucket_name
  key    = "data/${replace(each.value, ".csv", "")}/${each.value}"

  source = "${local.local_data_path}/${each.value}"
  etag   = filemd5("${local.local_data_path}/${each.value}")
}

# Create IAM users for Snowflake access
resource "aws_iam_user" "tuantd24" {
  name = "TuanTD24"
}

resource "aws_iam_user" "ducpb7" {
  name = "DucPB7"
}

resource "aws_iam_policy" "snowflake_s3_policy" {
  name = "snowflake_s3_access"
  description = "Policy to allow Snowflake access to S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject",
            "s3:DeleteObject"
        ]
        Resource = [
          "arn:aws:s3:::dvd-rental-ducpb7-tuantd24",
          "arn:aws:s3:::dvd-rental-ducpb7-tuantd24/*"
        ]
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_snowflake_policy_tuantd24" {
  user       = aws_iam_user.tuantd24.name
  policy_arn = aws_iam_policy.snowflake_s3_policy.arn
}

resource "aws_iam_user_policy_attachment" "attach_snowflake_policy_ducpb7" {
  user       = aws_iam_user.ducpb7.name
  policy_arn = aws_iam_policy.snowflake_s3_policy.arn
}

resource "aws_iam_access_key" "tuantd24_key" {
  user = aws_iam_user.tuantd24.name 
}

resource "aws_iam_access_key" "ducpb7_key" {
  user = aws_iam_user.ducpb7.name
}

output "tuantd24_aws_key" {
  value = aws_iam_access_key.tuantd24_key.id
  sensitive = true
}
output "tuantd24_aws_secret" {
  value = aws_iam_access_key.tuantd24_key.secret
  sensitive = true
}

output "ducpb7_aws_key" {
  value = aws_iam_access_key.ducpb7_key.id
  sensitive = true
}

output "ducpb7_aws_secret" {
  value = aws_iam_access_key.ducpb7_key.secret
  sensitive = true
}
