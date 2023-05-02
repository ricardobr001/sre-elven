output "ecr_image_uri" {
  value = "${aws_ecr_repository.repository.repository_url}:latest" 
}