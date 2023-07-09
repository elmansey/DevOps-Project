resource "aws_eip" "eip" {
  tags = {
    Name = "eip"
  }
}

resource "aws_nat_gateway" "main-ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.public_subnet_one_id

  tags = {
    Name = "main-ngw"
  }

  depends_on = [var.igw_id]
}