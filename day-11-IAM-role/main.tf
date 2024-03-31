# # Create the user
# resource "aws_iam_user" "user" {
#     name = "idontknow"
  
# }


# We create a policy
resource "aws_iam_policy" "secondpolicy" {       # Here it is aws_iam_policy and not aws_iam_user_policy               
    name   = "secondpolicy"
    policy = jsonencode({
        Version = "2012-10-17",                            # This JSON code can be copied from the policy name when viewd in JSON format 
        Statement= [
            {
                Action: "ec2:*"     # Allows all the ec2 related permissions 
                Effect: "Allow"
                Resource: "*"
            }
        ]
    })
}

#Creation of Role
resource "aws_iam_role" "firstrole" {
    name = "iam1role"

    assume_role_policy = jsonencode({            # So, in essence, this JSON code defines a policy that allows EC2 instances to assume a specific IAM role, granting them certain permissions based on the policies attached to that role.
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"                  # The assume_role_policy attribute in Terraform's IAM role resource enables you to specify conditions for entities to temporarily adopt the permissions of that role. This facilitates cross-account access, service utilization, and security policy enforcement within AWS environments.
                Effect = "Allow"                         
                Sid = "iam1role"
                Principal = {
                    Service = "ec2.amazonaws.com"

            }
            }
        ]
    })
  
}

# Attaching the policy to the role 
resource "aws_iam_policy_attachment" "policytorole" {
    name = "firstattachment"
    roles = [aws_iam_role.firstrole.name]
    policy_arn = aws_iam_policy.secondpolicy.arn
  
}

# Creating Instance profile using role
resource "aws_iam_instance_profile" "firstprofile" {    # In Summary the instance profile named "firstprofile" it associated with the existing role "firstrole" this allows Ec2 instances launched with this instance profile to inherit the permissions of the associated IAM role.
    name = "firstprofile"
    role = aws_iam_role.firstrole.name
  
}

#Creating the Instance and attaching the role 
 resource "aws_instance" "roleinstance" {
    ami = var.image_id
    instance_type = var.instance_type
    iam_instance_profile = aws_iam_instance_profile.firstprofile.name

 }