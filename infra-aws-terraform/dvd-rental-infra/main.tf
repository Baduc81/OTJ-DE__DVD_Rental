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

