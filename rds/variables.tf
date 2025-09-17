variable "region" {
    description = "Aws region "
    default = "eu-west-1" 
}

variable "db_username" {
    description = "Rds db username "
    type = string
}

variable "aws_cidr_block" {
  default = "10.0.0.0/16"
}


variable "aws_public_subnet_a" {
  default = "10.0.1.0/24"
}
variable "aws_public_subnet_b" {
  default = "10.0.2.0/24"
}

variable "aws_az" {
  default = "eu-west-1"
}

 