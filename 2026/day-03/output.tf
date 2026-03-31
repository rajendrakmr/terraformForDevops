# output "ec_public_ip" {
#  value = aws_instance.my_instance[*].public_ip
# }

# output "ec_private_ip" {
#  value = aws_instance.my_instance[*].private_ip
# }
# output "ec_public_dns" {
#  value = aws_instance.my_instance[*].public_dns
# }

# for foreach ouput
output "ec_public_ip" {
    value = [
        for key in aws_instance.my_instance: key.public_ip
    ]
  
}

output "ec_private_ip" {
    value = [
        for key in aws_instance.my_instance: key.private_ip
    ]
  
}

output "ec_public_dns" {
    value = [
        for key in aws_instance.my_instance: key.public_dns
    ]
  
}