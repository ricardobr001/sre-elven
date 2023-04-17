resource "aws_vpc_endpoint" "ecr-dkr-endpoint" {
  vpc_id              = aws_vpc.vpc.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc_security_group.id]
  subnet_ids          = [aws_subnet.subnet_AZ_A_private.id, aws_subnet.subnet_AZ_B_private.id]
}

resource "aws_vpc_endpoint" "ecr-api-endpoint" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.vpc_security_group.id]
  subnet_ids          = [aws_subnet.subnet_AZ_A_private.id, aws_subnet.subnet_AZ_B_private.id]
}

resource "aws_vpc_endpoint" "ecs-agent" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.us-east-1.ecs-agent"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.vpc_security_group.id]
  subnet_ids          = [aws_subnet.subnet_AZ_A_private.id, aws_subnet.subnet_AZ_B_private.id]
}

resource "aws_vpc_endpoint" "ecs-telemetry" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.us-east-1.ecs-telemetry"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.vpc_security_group.id]
  subnet_ids          = [aws_subnet.subnet_AZ_A_private.id, aws_subnet.subnet_AZ_B_private.id]
}
