module "ecr_kms" {
  source      = "git@github.com:TransformCore/internal-terraform-aws-kms.git?ref=v0.0.1"
  name        = "${local.project}-ecr-key"
  description = "Key to encrypt the ECR."

  tags = {
    Terraform = "true"
  }
}

module "athena_kms" {
  source      = "git@github.com:TransformCore/internal-terraform-aws-kms.git?ref=v0.0.1"
  name        = "${local.project}-athena-key"
  description = "Key to encrypt the Athena database."

  tags = {
    Terraform = "true"
  }
}

module "paramstore_kms" {
  source      = "git@github.com:TransformCore/internal-terraform-aws-kms.git?ref=v0.0.1"
  name        = "${local.project}-ssm-key"
  description = "Key to encrypt secrets in Parameter Store."

  tags = {
    Terraform = "true"
  }
}
