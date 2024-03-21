variable "ami_id" {
    description = "Passing ami_id to main.tf file"
    
  
}

variable "instance_type" {
    description = "Passing instance type to main.tf file"
    

}

variable "key_name" {  #This name can be anything not the defined one any name can eb given here and that has to be called in the ec2 file
    description = "passing key name to main.tf file"
    
  
}

variable "name" {
    description = "adding the tags to the main.tf file through modules and the name will be given in the module"
  
}