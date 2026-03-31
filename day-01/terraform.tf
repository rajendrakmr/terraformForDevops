resource "local_file" "my_file" {

  filename = "terraform-file.txt"
  content  = "This File is created by terraform"

}