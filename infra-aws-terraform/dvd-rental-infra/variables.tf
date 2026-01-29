variable "snowflake_organization_name" {
  type = string
  default = "EONYLEP"
}

variable "snowflake_account_name" {
  type = string
  default = "SO18247"
}

variable "snowflake_login_name" {
  type = string
  default = "BADUC11TIN"
}

variable "snowflake_login_password" {
  type = string
  default = "PhanBaDuc2004@"
}
# ---------------------------------------------------
variable "aws_account_id" {
  description = "AWS Account ID for Snowflake integration"
  type        = string
  default     = "874831691917"
}

# ---------------------------------------------------
variable "bucket_name" {
  description = "S3 bucket name for Snowflake integration"
  type        = string
  default     = "dvd-rental-ducpb7-tuantd24"
}

variable "s3_prefix" {
  description = "S3 prefix/folder path"
  type        = string
  default     = "data/"
}

variable "integration_name" {
  description = "Name of the Snowflake storage integration"
  type        = string
  default     = "S3_DVD_RENTAL_INTEGRATION"
}