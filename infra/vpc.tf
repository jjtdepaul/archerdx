# Internet VPC
resource "aws_vpc" "archer" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "archer"
  }
}

# Subnets
resource "aws_subnet" "archer-public-1" {
  vpc_id                  = aws_vpc.archer.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AZ1}"

  tags = {
    Name = "archer-public-1"
  }
}

resource "aws_subnet" "archer-public-2" {
  vpc_id                  = aws_vpc.archer.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AZ2}"

  tags = {
    Name = "archer-public-2"
  }
}

resource "aws_subnet" "archer-private-1" {
  vpc_id                  = aws_vpc.archer.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AZ1}"

  tags = {
    Name = "archer-private-1"
  }
}

resource "aws_subnet" "archer-private-2" {
  vpc_id                  = aws_vpc.archer.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AZ2}"

  tags = {
    Name = "archer-private-2"
  }
}


# Internet GW
resource "aws_internet_gateway" "archer-gw" {
  vpc_id = aws_vpc.archer.id

  tags = {
    Name = "archer"
  }
}

# route tables
resource "aws_route_table" "archer-public" {
  vpc_id = aws_vpc.archer.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.archer-gw.id
  }

  tags = {
    Name = "archer-public-1"
  }
}

# route associations public
resource "aws_route_table_association" "archer-public-1-a" {
  subnet_id      = aws_subnet.archer-public-1.id
  route_table_id = aws_route_table.archer-public.id
}

resource "aws_route_table_association" "archer-public-2-a" {
  subnet_id      = aws_subnet.archer-public-2.id
  route_table_id = aws_route_table.archer-public.id
}
