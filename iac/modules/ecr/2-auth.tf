# IAM Role for GitHub Actions to access AWS via OIDC
resource "aws_iam_role" "github_actions_role" {
  name = "github-actions-admin-role"
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
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:GenzooCorp/*"
          }
        }
      }
    ]
  })
}

# Attach AWS AdministratorAccess managed policy
resource "aws_iam_role_policy_attachment" "attach_admin" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}




# # Policy to allow pushing to ECR
# resource "aws_iam_policy" "ecr_push_policy" {
#   name        = "ecr-push-policy"
#   description = "Allow push to ECR"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Effect   = "Allow",
#       Action   = [
#         "ecr:GetAuthorizationToken",
#         "ecr:BatchCheckLayerAvailability",
#         "ecr:PutImage",
#         "ecr:InitiateLayerUpload",
#         "ecr:UploadLayerPart",
#         "ecr:CompleteLayerUpload",
#         "ecr:DescribeRepositories",
#         "ecr:GetDownloadUrlForLayer",
#         "ecr:BatchGetImage"
#       ],
#       Resource = "*"
#     }]
#   })
# }

# # Attach the policy to the role
# resource "aws_iam_role_policy_attachment" "attach_ecr" {
#   role       = aws_iam_role.github_actions_role.name
#   policy_arn = aws_iam_policy.ecr_push_policy.arn
# }


