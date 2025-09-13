#************************* create DB subnet group *************
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "demo-db-subnet-group"
  subnet_ids = [
    aws_subnet.my_private_sub_a.id,
    aws_subnet.my_private_sub_b.id
  ]

  tags = {
    Name = "demo-db-subnet-group"
  }
}
