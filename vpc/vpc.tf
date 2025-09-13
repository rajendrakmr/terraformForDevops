# create vpc 

resource "aws_vpc" "my_vpc_custom" {
    cidr_block = var.aws_cidr_block
    enable_dns_hostnames = true 
    enable_dns_support =  true
    tags = {
      Name = "my-vpc"
    }
  
}

# 
# _________________________create subnet_____________________
## create subnet 

resource "aws_subnet" "my_public_sub" {
    vpc_id = aws_vpc.my_vpc_custom.id 
    cidr_block = var.aws_public_sub_cidr
    availability_zone = var.aws_az
    map_public_ip_on_launch  = true
    tags = {
      Name = "my-public-subnet"
    } 
}
# create internet gatway
resource "aws_internet_gateway" "my_ig" {
    vpc_id = aws_vpc.my_vpc_custom.id
    tags = {
        Name="my-ig"
    }
  
}


# create route table

resource "aws_route_table" "my-rt" {
    vpc_id = aws_vpc.my_vpc_custom.id 
     
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_ig.id
    } 
    tags = {
      Name="my-route-table"
    }
}

resource "aws_route_table_association" "my-rt-association" {
  subnet_id      = aws_subnet.my_public_sub.id 
  route_table_id = aws_route_table.my-rt.id
}