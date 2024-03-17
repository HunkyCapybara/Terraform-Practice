resource "aws_instance" "raju" {
    ami = "ami-022661f8a4a1b91cf"
    instance_type = "t2.micro"
    key_name = "Git"
    tags = {
        Name = "Raju"
    }
}