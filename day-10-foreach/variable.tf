variable "ami" {
    type = string
    default = "ami-022661f8a4a1b91cf"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "instancescount" {
    type = list(string)
    default = [ "dev","prod" ]

}