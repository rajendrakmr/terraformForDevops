variable "aws_instance_type" {
    default = "t2.micro"
    type = string
}

variable "aws_ami_id" {
    default = "ami-03446a3af42c5e74e"
    type = string
  
}

variable "aws_volume_storage" {
    default = 12
    type = number
  
}

variable "aws_env" {
    default = "prd"
    type = string
  
}

