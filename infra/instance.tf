resource "aws_instance" "app" {
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
    Name  = "archer-app"
  }


}

# Jenkins instance
resource "aws_instance" "jenkins" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.small"

  # the VPC subnet
  subnet_id = aws_subnet.archer-public.*.pub_a[0].id 

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id,aws_security_group.allow-8080.id]

  # the public SSH key
  key_name = aws_key_pair.archerkeypair.key_name

  monitoring = true

  # user data
  user_data = data.template_cloudinit_config.cloudinit-docker.rendered
  tags = {
    Name  = "archer-jenkins"
  }

}
