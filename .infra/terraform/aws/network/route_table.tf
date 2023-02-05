resource "aws_route_table" "sre_wordpress_public_rt" {
  vpc_id = aws_vpc.sre_wordpress_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sre_wordpress_igw.id
  }

  tags = {
    Name = "Wordpress public route table"
  }
}

resource "aws_route_table" "sre_wordpress_private_rt" {
  vpc_id = aws_vpc.sre_wordpress_vpc.id

  tags = {
    Name = "Wordpress private route table"
  }
}

resource "aws_route_table_association" "public_rt_subnet_a" {
  subnet_id      = aws_subnet.sre_wordpress_subnet_AZ_A_public.id
  route_table_id = aws_route_table.sre_wordpress_public_rt.id
}

resource "aws_route_table_association" "public_rt_subnet_b" {
  subnet_id      = aws_subnet.sre_wordpress_subnet_AZ_B_public.id
  route_table_id = aws_route_table.sre_wordpress_public_rt.id
}

resource "aws_route_table_association" "private_rt_subnet_a" {
  subnet_id      = aws_subnet.sre_wordpress_subnet_AZ_A_private.id
  route_table_id = aws_route_table.sre_wordpress_private_rt.id
}

resource "aws_route_table_association" "private_rt_subnet_b" {
  subnet_id      = aws_subnet.sre_wordpress_subnet_AZ_B_private.id
  route_table_id = aws_route_table.sre_wordpress_private_rt.id
}
