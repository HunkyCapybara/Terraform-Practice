resource "aws_key_pair" "keyname" {
    public_key = file("~/.ssh/id_ed25519.pub")
  
}
resource "aws_instance" "server" {
    ami = "ami-0e0bf53f6def86294"
    instance_type = "t2.micro"
    key_name = aws_key_pair.keyname.key_name
}