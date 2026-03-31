output "ec_public_ip" {
 value = aws_instance.my_instance.public_ip
}

output "ec_private_ip" {
 value = aws_instance.my_instance.private_ip
}

