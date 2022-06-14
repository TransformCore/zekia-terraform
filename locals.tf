locals {
  project        = "zekia"
  container_name = "${local.project}-api-${var.environment}"
  s3_origin_id   = "s3OriginId"
  domain         = "zekia.io"

  parameters = {
    "AWS_TARGET_ACCOUNT_ROLE_NAME"     = aws_iam_role.assume_role.name
    "AWS_USE_BILLING_DATA"             = true
    "AWS_ATHENA_DB_NAME"               = aws_athena_database.main.name
    "AWS_ATHENA_DB_TABLE"              = "billing_data"
    "AWS_ATHENA_REGION"                = var.aws_region
    "AWS_ATHENA_QUERY_RESULT_LOCATION" = "s3://${aws_s3_bucket.athena.bucket}"
    "AWS_BILLING_ACCOUNT_ID"           = data.aws_caller_identity.current.account_id
    "AWS_BILLING_ACCOUNT_NAME"         = data.aws_iam_account_alias.current.account_alias
    "AWS_AUTH_MODE"                    = "AWS"
  }
}
