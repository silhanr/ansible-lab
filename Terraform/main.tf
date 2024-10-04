resource "aws_instance" "centos9_instance" {
  ami           = "ami-0fff1b9a61dec8a5f"  
  instance_type = "t2.micro"       # Use free-tier instance type
  vpc_security_group_ids  = [aws_security_group.sg_ansible_lab.id]  # Attach security group
 # subnet_id     = aws_default_vpc.default.subnet_id  # Use default subnet

  tags = {
    Name = "centos9-ansible-lab"
  }

  # Add this if you want to create and use a new SSH key pair
  key_name = "ansible_lab"
}