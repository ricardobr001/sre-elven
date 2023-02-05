resource "aws_internet_gateway" "sre_wordpress_igw" {
  vpc_id = aws_vpc.sre_wordpress_vpc.id

  tags = {
    Name = "Wordpress Internet Gateway"
  }
}
