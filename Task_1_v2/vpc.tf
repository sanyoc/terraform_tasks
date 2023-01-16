resource "aws_vpc" "task_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.task_tags
}

resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.task_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags              = var.task_tags

}
resource "aws_subnet" "public_1b" {
  vpc_id            = aws_vpc.task_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags              = var.task_tags

}
resource "aws_subnet" "public_1c" {
  vpc_id            = aws_vpc.task_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags              = var.task_tags

}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.task_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = var.task_tags
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.public_1b.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.task_vpc.id
  tags   = var.task_tags
}