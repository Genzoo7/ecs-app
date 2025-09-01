output "repository_url" {
  value       = aws_ecr_repository.this.repository_url
  description = "Repository URL of the ECR repository"
  depends_on  = [aws_ecr_repository.this]
}