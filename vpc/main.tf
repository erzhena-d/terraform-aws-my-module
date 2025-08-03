
resource "aws_vpc" "kaizen" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "public" {
  for_each = { for s in var.subnets : s.name => s }

  vpc_id            = aws_vpc.kaizen.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = each.key
  }
}


# resource "aws_subnet" "subnet1" {
#   vpc_id            = aws_vpc.kaizen.id
#   cidr_block        = var.subnet1_cidr
#   availability_zone = var.availability_zone1

#   tags = {
#     Name = "${var.environment}-subnet1"
#   }
# }

# resource "aws_subnet" "subnet2" {
#   vpc_id            = aws_vpc.kaizen.id
#   cidr_block        = var.subnet2_cidr
#   availability_zone = var.availability_zone2

#   tags = {
#     Name = "${var.environment}-subnet2"
#   }
# }

# resource "aws_subnet" "subnet3" {
#   vpc_id            = aws_vpc.kaizen.id
#   cidr_block        = var.subnet3_cidr
#   availability_zone = var.availability_zone3

#   tags = {
#     Name = "${var.environment}-subnet3"
#   }
# }

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "${var.environment}-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.environment}-public_rt"
  }
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
}

# resource "aws_route_table_association" "a" {
#   subnet_id      = aws_subnet.subnet1.id
#   route_table_id = aws_route_table.public_rt.id
# }

# resource "aws_route_table_association" "b" {
#   subnet_id      = aws_subnet.subnet2.id
#   route_table_id = aws_route_table.public_rt.id
# }

# resource "aws_route_table_association" "c" {
#   subnet_id      = aws_subnet.subnet3.id
#   route_table_id = aws_route_table.public_rt.id
# }

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.kaizen.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-allow_tls"
  }
}
