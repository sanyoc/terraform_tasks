resource "aws_vpc" "task-vpc" {
  cidr_block           = var.vpc-cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.task-tags
}

resource "aws_subnet" "public-1a" {
  vpc_id            = aws_vpc.task-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags              = var.task-tags

}
resource "aws_subnet" "public-1b" {
  vpc_id            = aws_vpc.task-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags              = var.task-tags

}
resource "aws_subnet" "public-1c" {
  vpc_id            = aws_vpc.task-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags              = var.task-tags

}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.task-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = var.task-tags
}

resource "aws_route_table_association" "public-1a" {
  subnet_id      = aws_subnet.public-1a.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "public-1b" {
  subnet_id      = aws_subnet.public-1b.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "public-1c" {
  subnet_id      = aws_subnet.public-1c.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.task-vpc.id
  tags   = var.task-tags
}



