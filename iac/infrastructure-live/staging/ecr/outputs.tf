output "repository_url" {
  value       = module.ecr.repository_url
  sensitive   = true
  description = "URL do ECR repozytorium"
}