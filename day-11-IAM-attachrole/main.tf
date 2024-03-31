data "aws_iam_instance_profile" "existing_role" {
    name = var.role_name
  
}

resource "aws_instance" "roleattaching" {
    instance_type = var.instance_type
    ami = var.image_id
    iam_instance_profile = data.aws_iam_instance_profile.existing_role.role_name
    tags = {
        Name = var.instancename
    }
}