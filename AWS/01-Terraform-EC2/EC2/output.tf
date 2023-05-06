output "ec2_ip" {
  value = aws_instance.terra-test.public_ip
}

output "ami_id" {
  value = data.aws_ami.ami_image.id
}