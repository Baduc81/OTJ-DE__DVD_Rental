terraform {
  required_version = ">= 1.6.0"

  backend "s3" {
    bucket       = "dvd-rental-ducpb7-tuantd24"
    key          = "tf_backend/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.28"
    }
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.90"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "snowflake" {
  # Configuration options for the Snowflake provider
  # Configure via environment variables:
  # export SNOWFLAKE_ACCOUNT="your_account"
  # export SNOWFLAKE_USER="your_user"
  # export SNOWFLAKE_PASSWORD="your_password"
  # Or specify directly (not recommended for production):

  # account  = "your_account"
  # user     = "your_user"
  # password = "your_password"
  account_name      = var.snowflake_account_name
  organization_name = var.snowflake_organization_name
  user              = var.snowflake_login_name
  password          = var.snowflake_login_password
  role              = "ACCOUNTADMIN" # Or another role with appropriate privileges
}