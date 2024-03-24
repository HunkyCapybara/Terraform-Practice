# Here just the name will be same and the number value changes accordingly with the continuing of numbers
# resource "aws_instance" "count1" {
#     ami = "ami-022661f8a4a1b91cf"
#     instance_type = "t2.micro"
#     count = 2
#     tags = {
#         Name = "dev.${count.index}" # This should give the name of dev as the instance name and also th number starting from 0 , like the names would be dev0 ,dev1
#     }

# }

resource "aws_instance" "count2" {
    ami = var.ami
    instance_type = var.instance
    count = length(var.something)  # This will take the count from the defined variable of names and create that many instances

    tags = {
        Name  = var.something[count.index] # This should name the instances accordingly to the names provided in the variable we defined
    }
  
}