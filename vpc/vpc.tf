##************************** create VPC **********************
resource "aws_vpc" "my_vpc_custom" {
  cidr_block           = var.aws_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "my-vpc"
  }
}

##************************* create public subnet **************
resource "aws_subnet" "my_public_sub" {
  vpc_id                  = aws_vpc.my_vpc_custom.id
  cidr_block              = var.aws_public_sub_cidr
  availability_zone       = var.aws_aza
  map_public_ip_on_launch = true

  tags = {
    Name = "my-public-subnet"
  }
}

##************************* create private subnet A ***********
resource "aws_subnet" "my_private_sub_a" {
  vpc_id                  = aws_vpc.my_vpc_custom.id
  cidr_block              = var.aws_private_sub_cidr_a
  availability_zone       = var.aws_aza
  map_public_ip_on_launch = false

  tags = {
    Name = "my-private-subnet-a"
  }
}

##************************* create private subnet B ***********
resource "aws_subnet" "my_private_sub_b" {
  vpc_id                  = aws_vpc.my_vpc_custom.id
  cidr_block              = var.aws_private_sub_cidr_b
  availability_zone       = var.aws_azb
  map_public_ip_on_launch = false

  tags = {
    Name = "my-private-subnet-b"
  }
}

#************************* create internet gateway ************
resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.my_vpc_custom.id

  tags = {
    Name = "my-ig"
  }
}

#************************* create route table ****************
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc_custom.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id
  }

  tags = {
    Name = "my-route-table"
  }
}

resource "aws_route_table_association" "my_rt_association" {
  subnet_id      = aws_subnet.my_public_sub.id
  route_table_id = aws_route_table.my_rt.id
}

