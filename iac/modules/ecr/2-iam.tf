# IAM Role for GitHub Actions to access ECR (OIDC)
resource "aws_iam_role" "github_actions_role" {
  name               = "github-actions-ecr-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
            "token.actions.githubusercontent.com:sub" = "repo:your-github-username/your-repo-name:ref:refs/heads/main"
          }
        }
      }
    ]
  })
}

# Policy to allow pushing to ECR
resource "aws_iam_policy" "ecr_push_policy" {
  name        = "ecr-push-policy"
  description = "Allow push to ECR"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload"
      ],
      Resource = "*"
    }]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "attach_ecr" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = aws_iam_policy.ecr_push_policy.arn
}