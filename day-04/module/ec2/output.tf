output "infra_public_ip" {
    value = aws_instance.infra_instance.public_ip 
}

output "infra_public_dns" {
    value = aws_instance.infra_instance.public_dns 
}

output "infra_private_ip" {
    value = aws_instance.infra_instance.private_ip 
}