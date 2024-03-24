resource "aws_instance" "foreach" {

ami = var.ami
instance_type = var.instance_type
for_each = toset(var.instancescount) # Always give for for each if you are using for each other wise it will give error for tags each.value

tags = {
  Name = each.value 
}

}