
variable "project" {
  default = "myapp"
}


variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type    = string
}
variable "availability_zones" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]

}

variable "public_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidr" {
  type    = list(string)
  default = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}


variable "common_tags" {
  type = map(string)
  default = {
    Project   = "myapp"
    ManagedBy = "terraform"
  }
}
