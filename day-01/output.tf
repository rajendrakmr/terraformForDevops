output "instace_public_ip" {
  value = aws_instance.my_instance.public_ip
}
output "instace_public_dns" {
  value = aws_instance.my_instance.public_dns
}
output "instace_private_ip" {
  value = aws_instance.my_instance.private_ip
}