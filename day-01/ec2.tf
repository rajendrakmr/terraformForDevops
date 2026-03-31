resource "aws_key_pair" "name" {
  key_name   = "terraform-automate-key"
  public_key = file("terraform-automate-key.pub")

}

resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "sg" {
  vpc_id = aws_default_vpc.default.id
  name   = "Terrafor automate server sg."
  tags = {
    Name = "Dev"
  }
}
resource "aws_vpc_security_group_ingress_rule" "ssh_allow" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "http_allow" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "https_allow" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
resource "aws_vpc_security_group_egress_rule" "name" {

  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  ip_protocol       = "-1"
}


resource "aws_instance" "my_instance" {
  ami                    = "ami-0d76b909de1a0595d"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.name]
  key_name               = aws_key_pair.name.key_name
  tags = {
    Name = "TErraform Automate server"
  }
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }
}
