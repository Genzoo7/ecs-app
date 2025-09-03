output "repository_url" {
  value       = module.ecr.repository_url
  sensitive   = true
  description = "URL do ECR repozytorium"
}

output "github_actions_role_arn" {
  value       = module.ecr.github_actions_role_arn
  sensitive   = true
  description = "ARN roli IAM dla GitHub Actions do użycia w sekretach GitHub"
}
# to get sensitive outputs from module use:
# terraform output -json | jq -r '.module_name | .sensitive_output_name.value'