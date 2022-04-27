resource "aws_ecr_repository" "main" {
  name                 = "${local.name}-repository-${var.environment}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "main" {
  repository = aws_ecr_repository.main.name
  policy     = file("./data/ecr_lifecycle_policy.json")
}
