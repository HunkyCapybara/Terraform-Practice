resource "aws_instance" "aftersometime" {
    ami = "ami-0e0bf53f6def86294"
    instance_type = "t2.micro"
    key_name = "Git"
    subnet_id = "subnet-0dd61dd8035a113b8"                          # After adding this subnet line and the below line im getting to see the other ports as the inbound rules 
    vpc_security_group_ids = [aws_security_group.aftersometime.id]  # If we did not add the above and this line then the for port in  in the security group will only take the default 22 and 80 port
    #Susprisingly after adding the above two lines after creating the instance it only modified the chnages not destroy and create
    tags= {
        Name = "for_loop"
    }
    root_block_device {  # used to define settings for the root block device (usually the primary disk) of an EC2 instance or other supported resources.
      volume_size = 40    #Apparently this is the volume size and it will be 40GiB
    

}

}

resource "aws_security_group" "aftersometime" {
    name = "somethingnew"
    description = "allows TLS inbound traffic"

    ingress = [
        for port in [443,80,22,8080,900,3000,8082] : {  # It is only taking the 22 and 80 port numbers in the security group Inbound rules
            description = "allows TLS inbound traffic"  # This description is important
            from_port = port
            to_port = port
            protocol = "tcp"
            cidr_blocks  = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
        Name = "for_loop_sg"
    }
}