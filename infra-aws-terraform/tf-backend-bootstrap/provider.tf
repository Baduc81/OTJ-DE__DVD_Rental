terraform {
    backend "s3" {
        bucket       = "dvd-rental-ducpb7-tuantd24"
        key          = "tf_backend/terraform.tfstate"
        region       = "us-east-1"
        encrypt      = true
        use_lockfile = true
    }
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.28.0"
        }
    }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}