#The whole point of this that we can create an Ec2 from the existing VPC and existing subnet through their name by using the data blocks and we use the filter command to filter among the vpc and subnets


data "aws_vpc" "vpcid" {
    filter {
      name = "tag:Name"
      values = ["cust_vpc"]  # Give the created VPC name here 
    }
  
}

data "aws_subnet" "subnet" {
    filter{
        name = "tag:Name"
        values = ["mysubnet"] # Give the created subnet name here
    }

}
resource "aws_security_group" "sg" {
    name   = "allows_tls"
    vpc_id = data.aws_vpc.vpcid.id # Give the local name of the vpc block
    tags = {
        Name = "security_group"
   }

   ingress {
    description = "TLS from vpc"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }
}

resource "aws_instance" "example2"{
    ami = "ami-0d7a109bf30624c99"
    instance_type = "t2.micro"
    key_name = "Worried"
    subnet_id = data.aws_subnet.subnet.id
    #Actually after removing this the code worked = vpc_security_groups_ids = [ aws_security_group.sg.id ] # here use the name defined for the security group
    tags = {
    Name = "Vry late at night"
    }
}