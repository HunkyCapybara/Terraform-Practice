#Different types of filter can be found from the AMI in the EC2 specification and if we also gave the name filter it will take that particular ami and now we have not specified thay so it will take the image form the specified filters

data "aws_ami" "amznewimage" {
    most_recent = true
    owners = [ "amazon" ]
    filter {
      name = "root-device-type"
      values = [ "ebs" ]
    }
    filter {
      name = "architecture" 
      values = [ "x86_64" ]

    }
    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }
}







data "aws_security_group" "smtng" {
    id = "sg-04df62960e44ff608"       # Put the security group from the already created instance 
  
}

data "aws_subnet" "smtng" {
    id = "subnet-0258cbd7b0eca0164"  # Put the subnet from the already created instance
}
