locals {
  bucket_name = "${var.secvar}-bucket-raju"  # So basically what it does is taking the name that has been defined in the variable block of var.secvar and that name it combines with -bucket-name ofcourse don't forget to put the whole thing in bracket and the variable block which we are defining should be in curly braces inside the double quotes

}

resource "aws_s3_bucket" "lcal" {
    bucket = local.bucket_name
    tags = {
      Name = local.bucket_name
      Environment = var.secvar  # This just shos the type of environment the project is working on like dev , test , prod we can name it accordingly with the ebrionment that is being used
    }

    }
  
