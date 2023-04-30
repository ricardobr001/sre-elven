resource "aws_security_group" "db_sg" {
  name   = "${var.product}-postgres-security-group"
  vpc_id = var.vpc_id

  ingress {
    description = "TCP"
    from_port   = 5432
    to_port     = 5432
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
    Name        = "${var.product} postgres security group"
    Environment = var.environment
    Terraformed = true
  }
}
