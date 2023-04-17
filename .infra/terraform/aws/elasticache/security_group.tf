resource "aws_security_group" "redis_security_group" {
  name   = "${var.product}-redis-security-group"
  vpc_id = var.vpc_id

  ingress {
    description = "TCP"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = var.private_cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "${var.product} redis security group"
    Environment = var.environment
    Terraformed = true
  }
}


resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "redis-subnet-group"
  subnet_ids = var.redis_subnets

  tags = {
    Name        = "${var.product} redis subnet group"
    Environment = var.environment
    Terraformed = true
  }
}
