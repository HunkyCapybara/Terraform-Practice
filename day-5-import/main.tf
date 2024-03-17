provider "aws" {
    region = "us-east-1"
  
}

#First only give the resouce block as the skeleton and then terraform import aws_instance.dev image id from the instance starts with i-
#Once they are done if you did not get any errors you will get the state file and you have to take values from state file and add them in the resource block

resource "aws_instance" "dev" {
    ami = "ami-0d7a109bf30624c99"
    instance_type = "t2.micro"
    key_name = "Worried"
  
}