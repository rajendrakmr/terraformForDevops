resource "aws_dynamodb_table" "my_table" {
  name         = "aws-dynamodb-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "userID"
  attribute {
    name = "userID"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }

}
