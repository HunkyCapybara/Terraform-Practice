variable "image_id" {
    description = "Giving the ami id from tfvars "
    type = string
}

variable "instance_type" {
    description = "Passing the value of instance_type"
    type   = string
}

variable "role_name" {
    description = "Passing the existing role name"
    type = string
}

variable "instancename" {
    description = "Passing the Instance name"
    type = string
  
}