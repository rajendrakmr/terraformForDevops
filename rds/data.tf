data "aws_ssm_parameter" "rds_username" {
  name            = "/myapp/rds-credentials/password"
  with_decryption = true

}
