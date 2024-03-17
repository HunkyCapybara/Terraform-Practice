#This is to import the S3 bucket form aws check the region once if you are getting any error  and the impoert code would be terraform import aws_s3_bucket.dev bucketname
provider "aws" {
    
  
}

resource "aws_s3_bucket" "dev" {
    bucket = ""
  
}

#Once the apply gets applies then the usual process of adding the values from the state file and to fill the resource block to make any changes