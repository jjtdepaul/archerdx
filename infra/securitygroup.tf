resource "aws_security_group" "allow-ssh" {
  vpc_id      = aws_vpc.archer.id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["73.153.131.221/32"]
  }
  tags = {
    Name = "allow-ssh"
  }
}


resource "aws_security_group" "allow-8080" {
  vpc_id      = aws_vpc.archer.id
  name        = "allow-8080"
  description = "security group that allows access to port8080 for Jenkins"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080 
    to_port     = 8080 
    protocol    = "tcp"
    cidr_blocks = ["73.153.131.221/32"]
  }
  tags = {
    Name = "allow-8080"
  }
}


resource "aws_security_group" "allow-3000" {
  vpc_id      = aws_vpc.archer.id
  name        = "allow-3000"
  description = "security group that allows access to port3000 for archer app"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["73.153.131.221/32"]
  }
  tags = {
    Name = "allow-3000"
  }
}
