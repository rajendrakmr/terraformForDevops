resource "aws_key_pair" "my_key_pair" {
  key_name   = "terraform-automate-key"
  public_key = file("terraform-automate-key.pub")
}

resource "aws_default_vpc" "my_vpc" {
}

resource "aws_security_group" "my_sg" {
  name        = "terraform-auto-server-sg"
  description = "This is allow all outbound traffic and incomming http ,ssh trafic"
  tags = {
    Name = "terraform-auto-server-sg"
  }

}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "TCP"

}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "TCP"

}


resource "aws_vpc_security_group_egress_rule" "allow_outbout" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


resource "aws_instance" "my_instance" {
  ami                    = var.aws_ami
  key_name               = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.name]
  instance_type          = "t3.micro"
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }
  user_data = file("userdata.sh")

  tags = {
    Name = var.instance_name
  }
}
