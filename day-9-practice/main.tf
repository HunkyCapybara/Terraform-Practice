#We kind of add the values here from where the source only contains the file and the varables which are defined to those resource block and again the variables values are defined here in the module block

module "please" {

    source = "../day-9-modules"
    ami_id = "ami-022661f8a4a1b91cf"
    instance_type = "t2.micro"
    key_name = "Git"

    name = "please"   # here we only give the values kind of like the tfstatevars
    
  
}