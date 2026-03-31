variable "infra_key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
}

variable "infra_instance_name" {
  description = "Name tag for EC2 instance"
  type        = string
}

variable "infra_volume_size" {
  description = "EBS volume size in GB"
  type        = number
}

variable "infra_security_group_name" {
  description = "Security group name for EC2 instance"
  type        = string
}


variable "infra_instance_id" {
  description = "Ec2 ami ID for instance"
  type        = string
}