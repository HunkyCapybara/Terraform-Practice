resource "aws_instance" "ntg" {
    ami = "ami-0e0bf53f6def86294"
    instance_type = "t2.micro"
    key_name = "Git"
    user_data = file("test.sh")
    tags = {
     Name = "Second Shell" 
    }
  
}

# If you are getting any error logging in the Ec2 and the Web HTML page check the security group Inbound rules and set to http and all traffic