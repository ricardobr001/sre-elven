resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.product}_db_subnet_group"
  subnet_ids = var.db_subnets

  tags = {
    Name        = "${var.product} subnet group"
    Environment = var.environment
    Terraformed = true
  }
}

resource "aws_db_parameter_group" "postgres_slow_query" {
  name   = "rds-postgres"
  family = "postgres11"

  # Slow Query parameters
  parameter {
    name  = "log_statement"
    value = "ddl"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = 1000
  }

  tags = {
    Name        = "${var.product} db parameter group"
    Environment = var.environment
    Terraformed = true
  }
}

resource "aws_db_instance" "db" {
  allocated_storage       = 10
  engine                  = "postgres"
  engine_version          = "11"
  instance_class          = "db.t2.micro"
  db_name                 = var.product
  username                = var.product
  password                = var.db_password
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  backup_retention_period = 7
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  multi_az                = true
  parameter_group_name    = aws_db_parameter_group.postgres_slow_query.name
  identifier              = "${var.product}-postgres"

  tags = {
    Name        = "${var.product} postgres db"
    Environment = var.environment
    Terraformed = true
  }
}

output "postgres_db_host" {
  value = aws_db_instance.db.address
}

output "postgres_db_password" {
  value = aws_db_instance.db.password
}
