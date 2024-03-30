resource "aws_key_pair" "Key" {
 public_key =  file("~/.ssh/id_ed25519.pub")
 key_name = "Public Key"  # It should actually show this name 
}

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

}

resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true
}
  
resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.vpc.id
  
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ig.id
    }

}

resource "aws_route_table_association" "rta" {
    subnet_id = aws_subnet.subnet.id
    route_table_id = aws_route_table.rt.id
  
}

resource "aws_security_group" "sg" {
    name = "smntg"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_instance" "instance" {
    ami = "ami-0e0bf53f6def86294"
    instance_type = "t2.micro"
    key_name = aws_key_pair.Key.id
    security_groups = [ aws_security_group.sg.id]
    subnet_id = aws_subnet.subnet.id
    tags = {
        Name = "Provisioners"
    }


#From here on we will use the Bastion Host method liek we usually connect through third party tools to connect to the instance and for that we will need the private key and the type of port used to connect 
#Both the connection and provisioner block should be present in the same resource blok whcih we are trying to conect

connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/id_ed25519") #here we are giving the Private key just lile the one we attach the pem file to connect to the Instance
    host = self.public_ip
}


#Local Execution Process , so basiclly the file gets created locally 
provisioner "local-exec" {
    command = "touch file 443"
}

# This proisioner to copy the file created in the source to destination host 
provisioner "file" {
    source = "file44" # Which we created manually in the local
    destination = "/home/ec2-user/file44" # Here in the middle block it changes accordingly like if there is ubuntu we have to put that name 
}

#This provisioner will execute the file on the remote location 
provisioner "remote-exec" {
    inline = [
        "touch file55",                      # Both the code lines are are the commands we use in the linux and for every command we give a comma 
        "echo hello from local >> file55"    #

    ]
}

}