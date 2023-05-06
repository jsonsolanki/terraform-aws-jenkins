data "aws_ami" "centos-linux-7" {
  most_recent = true
  owners = ["679593333241"]
  filter {
    name   = "name"
    values = ["CentOS-7-*.x86_64-d9a3032a-921c-4c6d-b150-bde168105e42"]
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