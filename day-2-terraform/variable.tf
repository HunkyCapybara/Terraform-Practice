variable "ami_id" {
    description = "Passing ami_id to main.tf file"
    type = string
    default = "ami-022661f8a4a1b91cf"
  
}

variable "instance_type" {
    description = "Passing instance type to main.tf file"
    type = string
    default = "t2.micro"

}

variable "key_name" {
    description = "passing key name to main.tf file"
    type = string
    default = "Git"
  
}