output "public_ip" {
    value = aws_instance.nlg.public_ip
  
}

output "private_ip" {
    value = aws_instance.nlg.private_ip
  
}