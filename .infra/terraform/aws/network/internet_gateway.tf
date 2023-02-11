resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.product} Internet Gateway"
    Environment = var.environment
    Terraformed = true
  }
}
