resource "aws_s3_bucket" "backend" {
    bucket = "dvd-rental-ducpb7-tuantd24"

    lifecycle {
        prevent_destroy = true
    }

    tags = {
        Name        = "Terraform Backend Bucket"
        Environment = "Dev"
    }
}
resource "aws_s3_bucket_versioning" "backend" {
    bucket = aws_s3_bucket.backend.id

    versioning_configuration {
        status = "Enabled"
    } 
}
