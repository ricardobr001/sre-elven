resource "aws_vpc_endpoint" "ecr-dkr-endpoint" {
  vpc_id       = var.vpc_id
  private_dns_enabled = true
  service_name = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.subnet_ids
}

resource "aws_vpc_endpoint" "ecr-api-endpoint" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids = var.subnet_ids
}

resource "aws_vpc_endpoint" "ecs-agent" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.us-east-1.ecs-agent"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids = var.subnet_ids
}

resource "aws_vpc_endpoint" "ecs-telemetry" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.us-east-1.ecs-telemetry"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids = var.subnet_ids
}