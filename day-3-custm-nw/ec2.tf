resource "aws_instance" "nlg" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.nlgsn.id
    key_name = var.key_name
    tags = {
        Name = "nlg"
    }
    associate_public_ip_address = true
    security_groups = [aws_security_group.nlgsg.id]
  
}

resource "aws_instance" "nlgpr" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.nlgsnpr.id
    tags = {
      Name = "nlgpr"
    }
    associate_public_ip_address = false
    security_groups = [aws_security_group.nlgsg.id]

}