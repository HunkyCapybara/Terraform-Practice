#First provider to create the first resource and also to specify the region
provider "aws" {
    region = "us-east-1"
}
  
#Second provider to create the second resource and also to specify the region with alias name as anything to define that name later
provider "aws" {
    region = "us-east-2"
    alias = "usa"
  
}