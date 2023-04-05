resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.product}-${var.environment}-cluster"
}

resource "aws_ecs_service" "ecs_service" {
  name            = "${var.product}-${var.environment}-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.task_security_group.id]
    subnets         = var.subnet_ids
  }

  load_balancer {
    target_group_arn = var.loadbalancer_target_group_id
    container_name   = "${var.product}-${var.environment}-app"
    container_port   = 8080
  }
}
