
## Create VPC - Start ###
resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.vpc_instance_tenancy
  tags = {
    Name = var.vpc_name
  }
}

## Create VPC - END ###

## Create Public Subnet - Start ###

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.all_ip_cidr_block
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = var.public_route_table_name
  }
}

resource "aws_route_table_association" "name" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

## Create Public Subnet - END ###

## Create Private Subnet - Start ###

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidr_block
  tags = {
    Name = var.private_subnet_name
  }
  map_public_ip_on_launch = true
}

resource "aws_eip" "eip" {
  domain = "vpc"
  tags = {
    Name = "Private-Subnet-EIP"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id = aws_subnet.public_subnet.id
  allocation_id = aws_eip.eip.id
  tags = {
    Name = var.nat_gateway_name
  }
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = var.private_route_table_name
    }
    route {
        cidr_block = var.all_ip_cidr_block
        nat_gateway_id = aws_nat_gateway.nat_gateway.id
    }
}

resource "aws_route_table_association" "private_subnet_route_association" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

## Create Private Subnet - End ###


