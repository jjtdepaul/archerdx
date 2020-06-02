resource "aws_instance" "nginx" {
  count = 2
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.archer-public-count.index.id
  #subnet_id = aws_subnet.archer-public-2.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.archerkeypair.key_name

  monitoring = true

  # user data
  #user_data = data.template_cloudinit_config.cloudinit-example.rendered
  tags = {
    Name  = "archer-nginx-${count.index + 1}"
  }


}

