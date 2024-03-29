resource "aws_ecr_repository" "main" {
  name                 = "${local.project}-repository-${var.environment}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = "arn:aws:kms:${var.aws_region}:${data.aws_caller_identity.current.account_id}:key/${module.ecr_kms.key_id}"
  }
}

resource "aws_ecr_lifecycle_policy" "main" {
  repository = aws_ecr_repository.main.name
  policy     = file("./data/ecr_lifecycle_policy.json")
}

resource "aws_iam_policy" "ecr_policy" {
  name   = "${local.project}-ecr-policy"
  policy = data.aws_iam_policy_document.ecr.json

}

data "aws_iam_policy_document" "ecr" {
  statement {
    effect = "Allow"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetLifecyclePolicy",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]
    resources = [aws_ecr_repository.main.arn]
  }
}
