# Set EC2 Virtual Machine Installation Region
variable "region" {
    type = string
}

# Set EC2 Virtual Machine Name and Tag
variable "instance_name" {
    type = string
}

# Enter Image Owner name either id
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

#Set availability zone for where your instance deploy 
variable "az" {
   type = string
}

variable "netnum" {
  type = map
  default = {
    us-west-1a = 7
    us-west-1c = 4
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

variable "username" {
  type = map(string)
  default = {
    "amazon" = "ec2-user"
    "099720109477" = "ubuntu"
    "679593333241" = "centos"
  }
  
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
