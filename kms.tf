module "kms" {
  source      = "git@github.com:TransformCore/internal-terraform-aws-kms.git?ref=v0.0.1"
  name        = "ecr_kms_key"
  description = "Key to encrypt the ECR."

  tags = {
    Terraform = "true"
  }
}
