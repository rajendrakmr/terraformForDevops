resource "aws_key_pair" "infra_key" {
  key_name   = var.infra_key_name
  public_key = file("${var.infra_key_name}.pub")
}


resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "ingra_sg" {
  name       = var.infra_security_group_name
  depends_on = [aws_key_pair.infra_key]
  vpc_id     = aws_default_vpc.default.id
  tags = {
    Name = var.infra_security_group_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ingra_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  to_port           = 22
  from_port         = 22
  ip_protocol       = "TCP"
}

resource "aws_vpc_security_group_egress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ingra_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_instance" "infra_instance" {
  ami                    = var.infra_instance_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ingra_sg.name]
  key_name               = aws_key_pair.infra_key.key_name
  depends_on             = [aws_security_group.ingra_sg]
  root_block_device {
    volume_size = var.infra_volume_size
    volume_type = "gp3"
  }
  tags = {
    Name = var.infra_instance_name
  }
}
