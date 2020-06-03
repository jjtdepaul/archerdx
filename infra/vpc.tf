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

#resource "aws_subnet" "archer-private" {
#  count                   = length(var.AZS)
#  vpc_id                  = aws_vpc.archer.id
#  cidr_block              = element(var.private_cidrs, count.index)
#  map_public_ip_on_launch = "false"
#  availability_zone       = element(var.AZS, count.index)

#  tags = {
#    Name = "archer-private-${count.index}"
#  }
#}

#resource "aws_subnet" "archer-private" {
#  for_each                = toset(var.AZS)
#  vpc_id                  = aws_vpc.archer.id
#  cidr_block              = "10.0.2.0/24"
#  map_public_ip_on_launch = "false"
#  availability_zone       = each.key
#
#  tags = {
#    Name = "archer-private-${each.value}"
#  }
#}
