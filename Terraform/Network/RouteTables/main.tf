resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.ngw_id
  }

  tags = {
    Name = "private_route_table"
  }
}


# route table association 
resource "aws_route_table_association" "public_route_table_association_to_public_subnet_one" {
  subnet_id      = var.public_subnet_one_id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table_association_to_public_subnet_two" {
  subnet_id      = var.public_subnet_two_id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "private_route_table_association_private_subnet_one" {
  subnet_id      = var.private_subnet_one_id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_route_table_association_private_subnet_two" {
  subnet_id      = var.private_subnet_two_id
  route_table_id = aws_route_table.private_route_table.id
}