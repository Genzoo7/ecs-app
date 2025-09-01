resource "aws_ecr_repository" "this" {
  name = "${var.repo_name}-ecr-repository"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "${var.repo_name}-ecr-repository"
  }
}