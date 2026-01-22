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
resource "aws_subnet" "my_public_sub_a" {
  vpc_id                  = aws_vpc.my_vpc_custom.id
  cidr_block              = var.aws_public_subnet_a
  availability_zone       = "${var.aws_az}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-public-subnet"
  }
}

resource "aws_subnet" "my_public_sub_b" {
  vpc_id                  = aws_vpc.my_vpc_custom.id
  cidr_block              = var.aws_public_subnet_b
  availability_zone       = "${var.aws_az}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-public-subnet"
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
  subnet_id      = aws_subnet.my_public_sub_a.id
  route_table_id = aws_route_table.my_rt.id
}


resource "aws_route_table_association" "my_rt_association_b" {
  subnet_id      = aws_subnet.my_public_sub_b.id
  route_table_id = aws_route_table.my_rt.id
}


#************************* create DB subnet group *************
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "demo-db-subnet-group"
  subnet_ids = [
    aws_subnet.my_public_sub_a.id,
    aws_subnet.my_public_sub_b.id
  ]

  tags = {
    Name = "demo-db-subnet-group"
  }
}
