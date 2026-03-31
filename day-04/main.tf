module "ec2" {
  source                    = "./module/ec2/"
  infra_instance_id         = "ami-0d76b909de1a0595d"
  infra_security_group_name = "terraform-infra-sg"
  infra_key_name            = "terra-auto-key"
  infra_instance_name       = "Terraform automate server"
  infra_volume_size         = 10

}
