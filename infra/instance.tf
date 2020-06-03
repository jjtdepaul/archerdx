resource "aws_instance" "nginx" {
  for_each = aws_subnet.archer-public 
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = each.value.id 

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.archerkeypair.key_name

  monitoring = true

  # user data
  #user_data = data.template_cloudinit_config.cloudinit-example.rendered
  tags = {
    Name  = "archer-nginx"
  }


}

