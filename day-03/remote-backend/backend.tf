resource "aws_s3_bucket" "my_remote_bucket" {
  bucket = "remote-backend-infra-bucket"
  force_destroy = true
  tags = {
    Name = "remote-backend-infrom-bucket"
  }
}


resource "aws_dynamodb_table" "my_remote_table" {
  name         = "remote-backend-infra-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "remote-backend-infrom-table"
  }
}
