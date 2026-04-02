 
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "sg" {
  description = "This security group managed by Terraform"
  name        = "Terraform-sg"
  vpc_id      = aws_default_vpc.default.id

}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  for_each          = var.ingress_rules
  security_group_id = aws_security_group.sg.id
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_ipv4

}
