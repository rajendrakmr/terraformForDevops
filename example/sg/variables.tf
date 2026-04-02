variable "ingress_rules" {
  type = map(object({
    from_port   = string
    to_port     = string
    ip_protocol = string
    cidr_ipv4   = string
    description = optional(string, "")
  }))
  default = {
  }

}
