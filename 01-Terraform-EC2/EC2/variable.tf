# Set EC2 Virtual Machine Installation Region
variable "region" {
    type = string
    # default = "ap-south-1"
}

# Set EC2 Virtual Machine Name and Tag
variable "instance_name" {
    type = string
}


variable "image" {
    type = string
    default = "data.aws_ami.ubuntu22.id"
}

# Set EC2 Virtual Machine machine type like t2.small, t2.large
variable "instance_type" {
    type = string
    # default = "t2.micro" 
}

# Set your existing VPC id
variable "vpc_id" {
    type = string
#    default = "vpc-0f3a906a"
    # default = "vpc-28b15d41"
}

# Set your existing subnet Id to get ip on ec2
variable "subnet_id" {
    type = string
#    default = "subnet-056356da357b976fd"
    # default = "subnet-d730ddbe"
}

#Set availability zone for where your instance deploy 
variable "az" {
   type = string
#    default = "ap-south-1a"
}

# variable "az" {
#     type = map
#         default = {
#         ap-south-1 = ap-south-1a
#         saurav = 19
#     }
  
# }

# Select your exsting key use for new ec2
variable "key_id" {
    type = string
    # default = "key-095e72db411043f93"
  
}

# Write how much storage you need....
variable "storage" {
  type = number
#   default = 20
}