resource "aws_instance" "nlg" {
    key_name = "Git"
    ami = "ami-022661f8a4a1b91cf"
    instance_type = "t2.micro"

}

#So if we did not provide the dependency command it automaticallycreates the bucjet firsta nd then the Ec2 instance in this case particulary , Dependancies work fine if there are priority ones which needs to be installed first they will be installed and then accordingly by the number provided.
resource "aws_s3_bucket" "nlg" {
    bucket = "kjnifwoefliw"
    depends_on = [ aws_instance.nlg ]  // So now the AWS instance will be installed and then the S3 bucket.
}