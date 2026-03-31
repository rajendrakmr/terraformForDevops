terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.38.0"
    }
  }

   backend "s3" {
    bucket   = "remote-backend-infra-bucket"
    dynamodb_table = "remote-backend-infra-table"
    key      = "terraform.tfstate"
    region   = "us-west-2" 
  }
  
}

provider "aws" { 
  region = "us-west-2" 
}

