data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}

data "aws_secretsmanager_secret_version" "secrets" {
  secret_id = var.secret_id
}

locals {
  mailing_secrets = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)

  mailing_secrets_list = [
    for name, value in local.mailing_secrets : {
      name  = name
      value = value
    }
  ]
}

resource "aws_ecs_task_definition" "task_definition" {
  family                   = "${var.product}-${var.environment}-family"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn

  container_definitions = <<DEFINITION
[
  {
    "image": "${var.ecr_image}",
    "cpu": 1024,
    "memory": 2048,
    "name": "${var.product}-${var.environment}-app",
    "environment": ${jsonencode(local.mailing_secrets_list)},
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": 3333,
        "hostPort": 3333
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "gobarber-logs-backend",
        "awslogs-create-group": "true",
        "awslogs-region": "us-east-1",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]
DEFINITION
}
