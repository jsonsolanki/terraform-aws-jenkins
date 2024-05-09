data "aws_availability_zones" "available" {}

# data "aws_eks_cluster" "cluster" {
#   name = module.eks.cluster_name
# }

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}

data "aws_ami" "ami_image" {
  most_recent      = true
  owners           = ["${var.owner}"]

  filter {
    name   = "name"
    values = ( var.owner == "099720109477" ?  ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"] : 
               var.owner == "amazon" ? ["amzn2-ami-hvm-2.0.*"] :
               var.owner == "679593333241" ? ["CentOS-7-*.x86_64-d9a3032a-921c-4c6d-b150-bde168105e42"] : 
                ["kindly, check once your Image owner ID"])
  }
  
  filter {
      name   = "architecture"
      values = ["x86_64"]
  }
  
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
