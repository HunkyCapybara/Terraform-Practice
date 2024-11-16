variable "ami_id" {
    description = "Passing ami_id to main.tf file"
    type = string
    default = "ami-0b990d3cfca306617"
  
}

variable "instance_type" {
    description = "Passing instance type to main.tf file"
    type = string
    default = "t2.medium"

}

variable "key_name" {
    description = "passing key name to main.tf file"
    type = string
    default = "IAM"
  
}