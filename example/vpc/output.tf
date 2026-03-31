output "vpc_id" { value = aws_vpc.terra_vpc.id }
output "public_subnet_ids" { value = aws_subnet.terra_public_subnet[*].id }
output "private_subnet_ids" { value = aws_subnet.terra_private_subnet[*].id } 