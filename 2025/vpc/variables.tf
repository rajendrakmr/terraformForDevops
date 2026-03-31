variable "aws_region" {
    description = "aws provider region set"
    default = "eu-west-1"
}
variable "aws_cidr_block" {
  default = "10.0.0.0/16"
}

variable "aws_public_sub_cidr" {
  default = "10.0.1.0/24"
}

variable "aws_private_sub_cidr_a" {
  default = "10.0.2.0/24"
}

variable "aws_private_sub_cidr_b" {
  default = "10.0.3.0/24"
}

variable "aws_aza" {
  default = "eu-west-1a"
}

variable "aws_azb" {
  default = "eu-west-1b"
}
