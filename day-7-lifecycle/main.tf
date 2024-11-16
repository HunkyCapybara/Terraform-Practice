resource "aws_instance" "lyfcyl" {
    ami="ami-0e0bf53f6def86294"
    instance_type = "t3.micro"
    availability_zone = "us-east-2b"
    key_name = "Git"
    tags = {
        Name = "namiwamo"
    }

 
# Real-world example of why this is useful:

# You create the EC2 instance with the tag Name = "namiwamo"
# Later, someone manually adds another tag in AWS Console like Environment = "Testing"
# Without the lifecycle block:

# Next terraform apply would remove the Environment tag
# Terraform would try to maintain exactly what's in the code


# With the lifecycle block:

# The manually added Environment tag stays
# Terraform ignores changes to tags
#lifecycle {
 # ignore_changes = [ tags, ]
#}

#Terraform will give you an error saying that lifecylce resource there with block and cannot be destroyed unitll this is false
#lifecycle {
#  prevent_destroy = true
#}

#this attribute will create the new object first and then destroy the old one , i meaan the usual process if any change is made first destroy then create here after using this block it would be reverse 
lifecycle {
  create_before_destroy = true
}













#All the lifecylce blocks should be there above the resource instance column i mean all the lifecycle should be presen in the resource instance column
}