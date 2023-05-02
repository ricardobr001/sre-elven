resource "aws_ecr_repository" "repository" {
  name                 = "${var.product}-${var.environment}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.product} repository"
    Environment = var.environment
    Terraformed = true
  }
}