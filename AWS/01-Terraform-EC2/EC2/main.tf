resource "aws_instance" "terra-test" {

  ami = data.aws_ami.ami_image.id
  availability_zone = var.az
  instance_type = var.instance_type
  key_name = data.aws_key_pair.key.key_name
  
  root_block_device {
    volume_size = var.storage
    encrypted = true
    tags = local.tags
  }
  vpc_security_group_ids = [ "${aws_security_group.sec_group.id}" ]
  subnet_id = data.aws_subnet.sbid.id
  
  # key_name = aws_key_pair.generated_key.key_name
  # connection {
  #   type        = "ssh"
  #   host        = self.public_ip
  #   user        = "ec2-user"

  #   # Mention the exact private key name which will be generated 
  #   private_key = file("${var.instance_name}.pem")
  #   timeout     = "4m"
  #   }
  tags = local.tags
}