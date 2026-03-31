# CISR (creat vpc, internet gateway, subnet,routing table)

# vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-custom-vpc"
  }
}

# internet gatway
resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-ig"
  }

}
resource "aws_subnet" "my_pubclic_subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "public-subnet-az-1"
  }
}


resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id
  }
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.my_pubclic_subnet_1.id
  route_table_id = aws_route_table.my_rt.id
}
