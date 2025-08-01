
# Configure the AWS Provider
# Here we use variables 

provider "aws" {
  region = "us-east-2" # Ohio region
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet1_cidr
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet2_cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet3_cidr
  availability_zone       = var.availability_zone3
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-subnet3"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-igw"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.environment}-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.example.id
}

output "subnet_ids" {
  value = [aws_subnet1.id, aws_subnet2_id, aws_subnet3_id]
}
