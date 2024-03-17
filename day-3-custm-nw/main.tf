#Creating VPC 
resource "aws_vpc" "nlgvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "nlgvpc"
    }
    }
  
#Creating Internet Gateway and attaching it to the VPC
resource "aws_internet_gateway" "nlgig" {
    vpc_id = aws_vpc.nlgvpc.id
    tags = {
        Name = "nlgig"
}
  
}

#Creating Subnet and attaching it to the VPC
resource "aws_subnet" "nlgsn" {
    cidr_block = "10.0.0.0/24"
    vpc_id =aws_vpc.nlgvpc.id  
  tags = {
    Name = "nlgsn"
  }
  }
  
  #Creating Route Table and attaching it to the VPC and also editing the routes and attaching the internet gateway
  resource "aws_route_table" "nlgrt" {
    vpc_id = aws_vpc.nlgvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.nlgig.id
    }
  }

#Subnet association adding the subnet to the Route table
resource "aws_route_table_association" "nlgrt" {
route_table_id = aws_route_table.nlgrt.id
subnet_id = aws_subnet.nlgsn.id
  
}

#Security Group , the protocol is tcp because that is what it is there in aws inbound rules
resource "aws_security_group" "nlgsg" {
  name = "nlgsg"
  vpc_id = aws_vpc.nlgvpc.id
  tags = {
    Name = "nlgsg"
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
      from_port = 443
      to_port = 443
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

#Creation of the Elastic IP address , It should create an Elastic Ip address even without adding anything in it
resource "aws_eip" "nlgeip" {

}

#Creating NAT Gateway and assiging it to the public subnet to get the internet
resource "aws_nat_gateway" "nlgnat" {
  allocation_id = aws_eip.nlgeip.id
  subnet_id     = aws_subnet.nlgsn.id

  tags = {
    Name = "nlgNAT"
  }

}

#Creation of the Private Route table and Nat Gateway route Editing
resource "aws_route_table" "nlgrtpr" {
  vpc_id = aws_vpc.nlgvpc.id
  route{
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nlgnat.id
  }
  
}

#Subnet association of Private route table to private subnet 
resource "aws_route_table_association" "nlgrtpr" {
  route_table_id = aws_route_table.nlgrtpr.id
  subnet_id = aws_subnet.nlgsnpr.id
  
}
   
#Creation of Private Subnet 
resource "aws_subnet" "nlgsnpr" {
  vpc_id = aws_vpc.nlgvpc.id
  cidr_block = "10.0.10.0/24"
  tags = {
    Name = "nlgsnpr"
  }




}