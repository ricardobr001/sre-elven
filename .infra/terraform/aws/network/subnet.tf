resource "aws_subnet" "sre_wordpress_subnet_AZ_A_public" {
  vpc_id                  = aws_vpc.sre_wordpress_vpc.id
  cidr_block              = var.public_az_a_subnet_cidr_block
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Wordpress public subnet AZ-A"
  }
}

resource "aws_subnet" "sre_wordpress_subnet_AZ_B_public" {
  vpc_id                  = aws_vpc.sre_wordpress_vpc.id
  cidr_block              = var.public_az_b_subnet_cidr_block
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Wordpress public subnet AZ-B"
  }
}

resource "aws_subnet" "sre_wordpress_subnet_AZ_A_private" {
  vpc_id            = aws_vpc.sre_wordpress_vpc.id
  cidr_block        = var.private_az_a_subnet_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = "Wordpress private subnet AZ-A"
  }
}

resource "aws_subnet" "sre_wordpress_subnet_AZ_B_private" {
  vpc_id            = aws_vpc.sre_wordpress_vpc.id
  cidr_block        = var.private_az_b_subnet_cidr_block
  availability_zone = "us-east-1b"

  tags = {
    Name = "Wordpress private subnet AZ-B"
  }
}

output "public_az_a_subnet_id" {
  value = aws_subnet.sre_wordpress_subnet_AZ_A_public.id
}

output "public_az_b_subnet_id" {
  value = aws_subnet.sre_wordpress_subnet_AZ_B_public.id
}

output "private_az_a_subnet_id" {
  value = aws_subnet.sre_wordpress_subnet_AZ_A_private.id
}

output "private_az_b_subnet_id" {
  value = aws_subnet.sre_wordpress_subnet_AZ_B_private.id
}
