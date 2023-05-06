# Set EC2 Virtual Machine Installation Region
variable "region" {
    type = string
}

# Set EC2 Virtual Machine Name and Tag
variable "instance_name" {
    type = string
}

variable "owner" {
    type = string
}

# Set EC2 Virtual Machine machine type like t2.small, t2.large
variable "instance_type" {
    type = string
}

# Set your existing VPC id
variable "vpc_id" {
    type = string
}

# Set your existing subnet Id to get ip on ec2
variable "subnet_id" {
    type = string
}

#Set availability zone for where your instance deploy 
variable "az" {
   type = string
}

variable "netnum" {
  type = map
  default = {
    ap-south-1a = 1
    ap-south-1b = 0
    ap-south-1c = 2
  }
}

# Select your exsting key use for new ec2
variable "key_id" {
    type = string  
}

# Write how much storage you need....
variable "storage" {
  type = number
}

variable "extra_tags" {
  type    = map(string)
  default = {}

  description = "Extra tags to be included when tagging objects, in addition to the ones provided automatically by this module."
}

locals {
  tags = merge(
    var.extra_tags,
    {
       Name = "${var.instance_name}"
     },
  )
}