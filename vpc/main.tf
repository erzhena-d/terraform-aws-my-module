
# Configure the AWS Provider
# Here we use variables 

provider "aws" {
  region = "us-east-2" # Ohio region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  # tags = { 
  #   environment = var.environment
  # }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet1_cidr
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = true

  # tags = {
  #   Name = "subnet-1"
  # }
}

resource "aws_subnet" "main2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet2_cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = true

  # tags = {
  #   Name = "subnet-2"
  # }
}

resource "aws_subnet" "main3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet3_cidr
  availability_zone       = var.availability_zone3
  map_public_ip_on_launch = true

  # tags = {
  #   Name = "subnet-3"
  # }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  # tags = {
  #   Name = "main"
  # }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  # tags = {
  #   Name = "example"
  # }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.main2.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.main3.id
  route_table_id = aws_route_table.example.id
}
