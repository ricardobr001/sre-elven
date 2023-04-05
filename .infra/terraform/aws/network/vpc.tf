resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.product} ${var.environment} Vpc"
    Environment = var.environment
    Terraformed = true
  }
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}
