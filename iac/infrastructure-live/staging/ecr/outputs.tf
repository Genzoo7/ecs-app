output "repository_url" {
  value       = aws_ecr_repository.this.repository_url
  sensitive   = true
  description = "URL do ECR repozytorium"
}