resource "aws_instance" "terra-test" {

  ami = data.aws_ami.centos-linux-7.id  #Use for CentOS 7 Virtual Machine
#  ami = data.aws_ami.amazon_ami.id  #Use for AWS AMI 2 Virtual Machine
#  ami = data.aws_ami.ubuntu22.id  #Use for Ubuntu Virtual Machine
  availability_zone = var.az
  instance_type = var.instance_type
  key_name = data.aws_key_pair.key.key_name
  root_block_device {
    volume_size = var.storage
    encrypted = true
  }
  vpc_security_group_ids = [ "${aws_security_group.sec_group.id}" ]
  subnet_id = data.aws_subnet.sbid.id
  
  tags = {
        Name = var.instance_name
    }
}