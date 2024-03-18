data "aws_security_group" "smtng" {
    id = "sg-0534cacc0c89401ae"   
  
}

data "aws_subnet" "smtng" {
    id = "subnet-0258cbd7b0eca0164"
}
