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
  ami             = "ami-03446a3af42c5e74e"
  key_name        = aws_key_pair.my_key_name.key_name
  security_groups = [aws_security_group.sg.name]
  instance_type   = "t2.micro"

  root_block_device {
    volume_size = 12
    volume_type = "gp3"
  }
  tags = {
    Name="TF Automate server"
  }

}




