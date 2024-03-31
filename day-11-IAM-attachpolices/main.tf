#Create the user first 
resource "aws_iam_user" "firstuser" {
  name = "ThroughTerraform"
}

#Assiging the access key i.e., programmatical approach to the user
resource "aws_iam_access_key" "accesskey" {
    user = aws_iam_user.firstuser.id      # It is better to use name instead of id for these cases 
  
}

# Creating the inline policy for the user 
data "aws_iam_policy_document" "s3permissions" {
    statement {
      actions = [
        "s3:GetObject",                    # These are the various permissions which are present in the plocy editor for S3 service so that is why s3 name is present for every policy we can also select other service policies as well like ec2 , rds etc
        "s3:GetBucketPolicy",
        "s3:PutObject",
        "s3:DeleteObject"
      ]
resources = [ 
    "arn:aws:s3:::s3fullaccess7770/*"   # arn:aws:s3:::: This part indicates that the ARN belongs to an S3 bucket , s3fullaccess7770: This is the name of the S3 bucket which we havve created , /*: This wildcard (*) at the end denotes that the policy applies to all objects within the specified bucket (s3fullaccess7770).
 ]

    }
  
}

# Attaching the policy to the user 
resource "aws_iam_user_policy" "s3policiesattachment" {
    name = "s3inlinepolicy"
    user = aws_iam_user.firstuser.id           # It is better to use name instead of id for these cases
    policy = data.aws_iam_policy_document.s3permissions.json
  
}
  
# output "iam_user_access_key" {
#   value = aws_iam_access_key.accesskey.id                         # I tried to see the access key and secret key through output 
# }

# output "iam_user_secret_key" {
#   value     = aws_iam_access_key.accesskey.secret
#   sensitive = true
# }

