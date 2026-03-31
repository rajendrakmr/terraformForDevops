resource "aws_s3_bucket" "my_bucket" {
    bucket = "rk-remote-infra-bucket"
    tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

 