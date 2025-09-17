data "aws_secretsmanager_secret" "db" {
  name = "my-rds-password"
}

data "aws_secretsmanager_secret_version" "db" {
  secret_id = data.aws_secretsmanager_secret.db.id
}


# data.tf
data "aws_ssm_parameter" "db_username" {
  name = "/myapp/terraform/db_username"
  with_decryption = false
}
