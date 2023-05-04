resource "aws_security_group" "db_mongo_security_group" {
  name   = "${var.product}-mongo-security-group"
  vpc_id = var.vpc_id

  ingress {
    description = "TCP"
    from_port   = 27017
    to_port     = 27017
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
    Name        = "${var.product} sb security group"
    Environment = var.environment
    Terraformed = true
  }
}
