resource "aws_secretsmanager_secret" "gobarber_secrets" {
  name = "${var.product}-${var.environment}-app-secrets"

  tags = {
    Name        = "${var.product} secret manager"
    Environment = var.environment
    Terraformed = true
  }
}

output "secret_id" {
  value = aws_secretsmanager_secret.gobarber_secrets.id
}
