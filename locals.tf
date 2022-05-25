locals {
  project        = "zekia"
  container_name = "${local.project}-api-${var.environment}"
  s3_origin_id   = "s3OriginId"
  domain         = "zekia.io"
}
