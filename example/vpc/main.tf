resource "aws_vpc" "terra_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge(var.common_tags, { Name = "${var.project}-vpc" })
}

resource "aws_internet_gateway" "terra_iwg" {
  vpc_id     = aws_vpc.terra_vpc.id
  depends_on = [aws_vpc.terra_vpc]
  tags       = merge(var.common_tags, { Name = "${var.project}-iwg" })
}

resource "aws_subnet" "terra_public_subnet" {
  depends_on              = [aws_internet_gateway.terra_iwg]
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.terra_vpc.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = merge(var.common_tags, {
    Name = "${var.project}-public-${var.availability_zones[count.index]} "
    Tier = "public"
  })
}
resource "aws_subnet" "terra_private_subnet" {
  depends_on        = [aws_internet_gateway.terra_iwg]
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.terra_vpc.id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = merge(var.common_tags, {
    Name = "${var.project}-private-${var.availability_zones[count.index]} "
    Tier = "private"
  })
}

resource "aws_route_table" "terra_rt" {
  depends_on = [aws_vpc.terra_vpc]
  vpc_id     = aws_vpc.terra_vpc.id
  tags       = merge(var.common_tags, { Name = "${var.project}-rt-public" })
}

resource "aws_route_table_association" "public" {
  depends_on     = [aws_subnet.terra_private_subnet]
  count          = length(aws_subnet.terra_public_subnet)
  subnet_id      = aws_subnet.terra_public_subnet[count.index].id
  route_table_id = aws_route_table.terra_rt.id
}
resource "aws_route" "public_internet" {
  depends_on             = [aws_route_table.terra_rt]
  route_table_id         = aws_route_table.terra_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.terra_iwg.id
}