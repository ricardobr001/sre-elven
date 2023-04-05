resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.product} public route table"
    Environment = var.environment
    Terraformed = true
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.product} private route table"
    Environment = var.environment
    Terraformed = true
  }
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = "${aws_route_table.private_rt.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.0.id
}

resource "aws_route_table_association" "public_rt_subnet_a" {
  subnet_id      = aws_subnet.subnet_AZ_A_public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_subnet_b" {
  subnet_id      = aws_subnet.subnet_AZ_B_public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_subnet_a" {
  subnet_id      = aws_subnet.subnet_AZ_A_private.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_subnet_b" {
  subnet_id      = aws_subnet.subnet_AZ_B_private.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_main_route_table_association" "default" {
  route_table_id = aws_route_table.public_rt.id
  vpc_id         = aws_vpc.vpc.id
}
