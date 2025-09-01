# we need to create a nat gateway in each public subnet
# so that instances in private subnets can access the internet

resource "aws_eip" "this" {
  vpc = true

  tags = {
    Name = "${var.env}-nat"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  # lets use the first generated public subnet
  subnet_id     = aws_subnet.public[0].id

  lifecycle {
    create_before_destroy = true  # przy zmianie NAT Gateway TF najpierw tworzy nowy
    prevent_destroy       = false # upewniamy się, że destroy jest możliwy
  }
  
  tags = {
    Name = "${var.env}-nat-gateway"
  }

  depends_on = [aws_internet_gateway.this]
}

