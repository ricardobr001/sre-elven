resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.product} ${var.environment} vpc"
    Environment = var.environment
    Terraformed = true
  }
}

resource "aws_security_group" "vpc_security_group" {
  name   = "${var.product}-vpc-security-group"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  tags = {
    Name        = "${var.product} ${var.environment} vpc"
    Environment = var.environment
    Terraformed = true
  }
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}
