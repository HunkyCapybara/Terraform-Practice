resource "aws_s3_bucket" "s3bucketconfigurationsatefile" {
    bucket = "s3bucketconfigurationsatefile"
    
}

#Again this firstle created so that is why we are creating earlier and initliazing and then only giving the dynamodb in the resource block of the other directory main.tf file
resource "aws_dynamodb_table" "dynamdbterraformstatelock" {
    name="terraform-first-dynamodb" #name is important here because it gives an error mesage, this is the name that it shoes in the dybanamodb table 
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20
    attribute {
      name = "LockID"
      type = "S"
    }
}