data "aws_ami" "ami_image" {
  most_recent      = true
  owners           = ["${var.owner}"]

  filter {
    name   = "name"
    values = ( var.ownr == "099720109477" ?  ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"] : 
               var.ownr == "amazon" ? ["amzn2-ami-hvm-2.0.*"] :
               var.ownr == "679593333241" ? ["CentOS-7-*.x86_64-d9a3032a-921c-4c6d-b150-bde168105e42"] : 
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