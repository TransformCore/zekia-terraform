locals {
  project             = "zekia"
  container_name      = "${local.project}-api-${var.environment}"
  s3_origin_id        = "s3OriginId"
  domain              = "zekia.io"
  container_image     = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${aws_ecr_repository.main.name}"
  container_image_tag = "latest"

  parameters = [
    {
      name  = "AWS_TARGET_ACCOUNT_ROLE_NAME",
      value = aws_iam_role.ecs_task_execution_role.name
    },
    {
      name  = "AWS_USE_BILLING_DATA",
      value = "true"
    },
    {
      name  = "AWS_ATHENA_DB_NAME",
      value = aws_athena_database.main.name,
    },
    {
      name  = "AWS_ATHENA_DB_TABLE",
      value = "billing_data"
    },
    {
      name  = "AWS_ATHENA_REGION",
      value = var.aws_region
    },
    {
      name  = "AWS_ATHENA_QUERY_RESULT_LOCATION",
      value = "s3://${aws_s3_bucket.athena.bucket}"
    },
    {
      name  = "AWS_BILLING_ACCOUNT_ID",
      value = data.aws_caller_identity.current.account_id
    },
    {
      name  = "AWS_BILLING_ACCOUNT_NAME",
      value = data.aws_iam_account_alias.current.account_alias
    },
    {
      name  = "AWS_AUTH_MODE",
      value = "EC2-METADATA"
    }
  ]
}

data "aws_iam_account_alias" "current" {}
