terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.13.0"
    }
  }
}
provider "aws" {
  region = "eu-west-1"
}

# S3 bucket with workspace in its name
resource "aws_s3_bucket" "example" {
  bucket = "myapp-${terraform.workspace}-bucket-12345"

  tags = {
    Environment = terraform.workspace
  }
}
