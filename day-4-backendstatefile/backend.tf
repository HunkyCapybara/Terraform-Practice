terraform {
  backend "s3" {
    bucket = "s3bucketconfigurationsatefile"
    key    = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-first-dynamodb" # This will be called when the dyanmDB table is created in the day-4-statefile then only we have to call this
    encrypt = true
  }
}
