resource "aws_lb" "gobarber_loadbalancer" {
  name               = "${var.product}-${var.environment}"

  security_groups    = [aws_security_group.gobarber_loadbalancer_security_group.id]
  subnets            = var.gobarber_loadbalancer_subnets_ids

  tags = {
    Name = "${var.product} loadbalancer"
    Environment = var.environment
    Terraformed = true
  }
}

resource "aws_lb_target_group" "target_group" {
  name        = "${var.product}-${var.environment}-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_listener" "loadbalancer_listener" {
  load_balancer_arn = aws_lb.gobarber_loadbalancer.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target_group.id
    type             = "forward"
  }
}