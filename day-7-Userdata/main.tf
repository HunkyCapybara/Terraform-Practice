resource "aws_instance" "ntg" {
    ami = "ami-0e0bf53f6def86294"
    instance_type = "t2.micro"
    key_name = "Git"
    user_data = file("test.sh")
    tags = {
     Name = "Second Shell" 
    }
  
}