data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_subnet" "sbid" {
  vpc_id = data.aws_vpc.vpc.id
  availability_zone = var.az
  cidr_block = cidrsubnet(data.aws_vpc.vpc.cidr_block, 4, "${lookup(var.netnum, "${var.az}")}")
}

resource "aws_security_group" "sec_group" {
  name = " ${var.instance} allow internal aws network"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
      cidr_blocks = [ "172.31.0.0/16" ]
      description = "allow internal all port"
      from_port = 0
      protocol = -1
      to_port = 0
    }
    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Default outbound allow all"
      from_port = 0
      protocol = -1
      to_port = 0
    }
    tags = local.tags
}