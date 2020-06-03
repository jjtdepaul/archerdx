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
resource "aws_subnet" "archer-public" {
  for_each                = local.subnets  
  vpc_id                  = aws_vpc.archer.id
  cidr_block              = each.value.cidr 
  map_public_ip_on_launch = "true"
  availability_zone       = each.value.az 

  tags = {
    Name = "archer-public-each.value.az"
  }
}


# Internet GW
resource "aws_internet_gateway" "archer-gw" {
  vpc_id = aws_vpc.archer.id

  tags = {
    Name = "archer"
  }
}


# Route tables
resource "aws_route_table" "archer-public" {
  vpc_id = aws_vpc.archer.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.archer-gw.id
  }

  tags = {
    Name = "archer-public"
  }
}


# route associations public
resource "aws_route_table_association" "archer-public-assocs" {
  for_each       = aws_subnet.archer-public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.archer-public.id
}


