output "repository_url" {
  value       = aws_ecr_repository.this.repository_url
  description = "Repository URL of the ECR repository"
  depends_on  = [aws_ecr_repository.this]
}

# Output z pełnym ARN roli
output "github_actions_role_arn" {
  value = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${aws_iam_role.github_actions_role.name}"
  description = "ARN of the GitHub Actions IAM role to use in GitHub secrets"
}