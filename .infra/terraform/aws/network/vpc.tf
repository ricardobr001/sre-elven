resource "aws_vpc" "sre_wordpress_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "Wordpress Vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.sre_wordpress_vpc.id
}
