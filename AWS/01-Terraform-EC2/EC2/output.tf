output "EC2_IP" {
  value = aws_instance.terra-test.public_ip
}

output "AMI_ID" {
  value = data.aws_ami.ami_image.id
}

output "KEY_NAME" {
  value = aws_instance.terra-test.key_name
}
output "Username" {
  value = "${lookup(var.username, "${var.owner}")}"
  
}
