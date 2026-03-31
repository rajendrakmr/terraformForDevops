

resource "aws_default_vpc" "default" {
  
}
resource "aws_security_group" "my_sg" {
  vpc_id = aws_default_vpc.default.id
  name = "terraform-sg"
  description = "This is Aws securitry group allow access inbound and outbound access."
}

resource "aws_instance" "my_instance" {
    ami = "ami-0d76b909de1a0595d"
    instance_type="t3.micro"
    vpc_security_group_ids = [ aws_security_group.my_sg.name ]
    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }
}