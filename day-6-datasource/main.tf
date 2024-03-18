resource "aws_instance" "smtng" {
    ami = "ami-0d7a109bf30624c99"
    instance_type = "t2.micro"
    security_groups = [data.aws_security_group.smtng.id]
    subnet_id = data.aws_subnet.smtng.id
    tags = {
     Name = "smtng" 
    }
  
}