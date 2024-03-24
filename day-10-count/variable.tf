variable "ami" {
    type = string
    default = "ami-022661f8a4a1b91cf"
  
}

variable "instance" {
    type = string
    default = "t2.micro"


}

variable "something"{
    type = list(string) # This is important line 
    default = ["dev" ,"test" , "prod"]
}