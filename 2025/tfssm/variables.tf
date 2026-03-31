# variables.tf
variable "db_username" {
  description = "Database admin username"
  type        = string
   sensitive = false
} 