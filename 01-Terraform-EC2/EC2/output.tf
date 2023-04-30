output "ec2_ip" {
  value = aws_instance.terra-test.public_ip
}

#output "vp_id" {
#    value = aws_vpc.cust_vpc.id
#}

#output "sub_id" {
#    value = aws_subnet.cust_sbnt.id
#}