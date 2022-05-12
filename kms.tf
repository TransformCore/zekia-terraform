module "ecr_kms" {
  source      = "git@github.com:TransformCore/internal-terraform-aws-kms.git?ref=v0.0.1"
  name        = "${local.name}-ecr-key"
  description = "Key to encrypt the ECR."

  tags = {
    Terraform = "true"
  }
}

module "athena_kms" {
  source      = "git@github.com:TransformCore/internal-terraform-aws-kms.git?ref=v0.0.1"
  name        = "${local.name}-athena-key"
  description = "Key to encrypt the Athena database."

  tags = {
    Terraform = "true"
  }
}
