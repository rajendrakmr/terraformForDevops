variable "aws_region" {
    description = "aws provider region set"
    default = "eu-west-1"
}

variable "aws_cidr_block" {
    description = "aws provider region set"
    default = "10.0.0.0/16"  # 16 - 28
}

variable "aws_public_sub_cidr" {
    description = "CIDR block for public subnet"
    default = "10.0.1.0/24"  # 16 - 28
}

variable "aws_private_sub_cidr" {
    description = "CIDR block for private subnet"
    default = "10.0.2.0/22"  # 16 - 28
}


variable "aws_az" {
    description = "Availability zone"
    default = "eu-west-1a"   
}