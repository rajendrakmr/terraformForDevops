# key pair

resource "aws_key_pair" "my_key_name" {
  key_name   = "terraform-automation-key"
  public_key = file("./terraform-key.pub")

}

# vpc & security groups
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "sg" {
  name        = "automate-sg"
  description = "This is add a TF generated security group."
  vpc_id      = aws_default_vpc.default.id #interpolation

  # inbound rule

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http open"
  }
  # outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow allo outbound rule"
  }

  tags = {
    Name = "automate-sg"
  }

}
# ec2 instance

resource "aws_instance" "my_instance" {
  # count           = 2
  for_each = tomap({
    TF-Automate-micro  = "t2.micro",
    TF-Automate-medium = "t2.micro",
  })
  ami             = var.aws_ami_id
  key_name        = aws_key_pair.my_key_name.key_name
  security_groups = [aws_security_group.sg.name]
  instance_type   = each.value
  depends_on      = [aws_default_vpc.default, aws_security_group.sg, aws_key_pair.my_key_name]

  user_data = file("install_nginx.sh")
  root_block_device {
    volume_size = var.aws_env == "prd" ? 20 : var.aws_volume_storage
    volume_type = "gp3"
  }
  tags = {
    Name = each.key
  }

}




