resource "aws_secretsmanager_secret" "gobarber_secrets" {
  name = "${var.product}-${var.environment}-app-secrets-0"
  recovery_window_in_days = 0

  tags = {
    Name        = "${var.product} secret manager"
    Environment = var.environment
    Terraformed = true
  }
}

output "secret_id" {
  value = aws_secretsmanager_secret.gobarber_secrets.id
}
