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
  }
}

provider "aws" {
  region = "us-east-1"
}
