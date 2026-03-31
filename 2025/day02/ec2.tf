resource "aws_key_pair" "my_key" {
    key_name = "terra-auto-key"
    public_key = file("terra-auto-key.pub")
  
}

resource "aws_default_vpc" "default" {
  
}
resource "aws_security_group" "my_sg" {
    name = "terraform-sg"
    vpc_id =  aws_default_vpc.default.id
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH port."
    }
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
        description = "Allow http port."
    }
    ingress{
        from_port = 443
        to_port = 443
        protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
        description = "Allow https port."
    }
    egress{
        from_port = 0
        to_port = 0 
        protocol = "-1"
         cidr_blocks = ["0.0.0.0/0"]
        description = "allow all outbond trafic."
    }
}


resource "aws_instance" "my_instance" {
    ami = "ami-0bc691261a82b32bc"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_sg.name]
    # security_groups = [aws_security_g/roup.my_sg.name]
    user_data = file("install_ngin.sh")
    key_name = aws_key_pair.my_key.key_name
    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }
  
}