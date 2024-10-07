
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "sg_ansible_lab" {
  name        = "sg_ansible_lab"
  description = "For incoming SSH connection"
  vpc_id      = aws_default_vpc.default.id
  tags = {
    Name = "sg-ssh_incoming"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_incoming" {
  security_group_id = aws_security_group.sg_ansible_lab.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "all_out" {
  security_group_id = aws_security_group.sg_ansible_lab.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "tcp"
  to_port     = 0
}
