terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.28.0"
    }
  }
  backend "s3" {
    bucket = "rk-remote-infra-bucket"
    key = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "rk-remote-infra-table"
    
  }
}

provider "aws" {
  # Configuration options
  region = "eu-west-1"
}