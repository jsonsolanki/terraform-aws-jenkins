output "EC2_IP" {
  value = aws_instance.terra-test.public_ip
}

output "AMI_ID" {
  value = data.aws_ami.ami_image.id
}

output "Username" {
  value = "${lookup(var.username, "${var.owner}")}"
  
}