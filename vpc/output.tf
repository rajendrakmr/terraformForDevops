output "vpc_id" {
  value = aws_vpc.my_vpc_custom.id
}

output "public_subnet_id" {
  value = aws_subnet.my_public_sub.id
}

output "igw_id" {
  value = aws_internet_gateway.my_ig.id
}
