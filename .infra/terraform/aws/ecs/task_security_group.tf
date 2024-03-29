resource "aws_security_group" "task_security_group" {
  name   = "${var.product}-${var.environment}-task-security-group"
  vpc_id = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 3333
    to_port         = 3333
    security_groups = [var.loadbalancer_security_group_id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.product} task security group"
    Environment = var.environment
    Terraformed = true
  }
}
