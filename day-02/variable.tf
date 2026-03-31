variable "aws_ami" {
  default     = "ami-0d76b909de1a0595d"
  type        = string
  description = "This is the ubuntu image id"
}

variable "instance_name" {
  default     = "Terraform-automate Server"
  type        = string
  description = "This is the server name of instance"
}