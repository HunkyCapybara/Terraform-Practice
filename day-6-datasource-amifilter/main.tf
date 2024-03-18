resource "aws_instance" "smtng" {
    ami = data.aws_ami.amznewimage.id
    instance_type = "t2.micro"
    security_groups = [data.aws_security_group.smtng.id]
    subnet_id = data.aws_subnet.smtng.id
    associate_public_ip_address = true
    tags = {
     Name = "Smtng" 
    }
  
}