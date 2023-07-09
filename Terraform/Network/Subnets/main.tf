resource "aws_subnet" "public_subnet_one" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_block_one
  map_public_ip_on_launch=true
  availability_zone = var.availability_zone_one
  tags = {
    Name = "public_subnet_one"
  }
}

resource "aws_subnet" "public_subnet_two" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_block_two
  map_public_ip_on_launch=true
  availability_zone = var.availability_zone_two
  tags = {
    Name = "public_subnet_two"
  }
}

resource "aws_subnet" "private_subnet_one" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_block_three
  availability_zone = var.availability_zone_one
  tags = {
    Name = "private_subnet_one"
  }
}

resource "aws_subnet" "private_subnet_two" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_block_four
  availability_zone = var.availability_zone_two
  tags = {
    Name = "private_subnet_two"
  }
}