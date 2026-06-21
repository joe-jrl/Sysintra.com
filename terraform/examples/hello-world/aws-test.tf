terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

# Simple test resource
resource "aws_s3_bucket" "terraform_test" {
  bucket = "terraform-connectivity-test-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

# Output to confirm it worked
output "test_bucket_name" {
  value = aws_s3_bucket.terraform_test.bucket
}
