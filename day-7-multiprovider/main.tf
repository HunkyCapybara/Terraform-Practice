#Try to keep the local names for both the resource different as well
resource "aws_s3_bucket" "america" {
    bucket = "afwefwrfwerw"
  
}

resource "aws_s3_bucket" "austrlaia" {
    bucket = "wfwrweegfwfec"
    provider = aws.usa # the value of the provider which we specified in the proider block as alias
  
}