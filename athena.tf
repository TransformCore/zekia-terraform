resource "aws_s3_bucket" "athena" {
  bucket = "${local.project}-athena-results"
}

resource "aws_s3_bucket_acl" "athena" {
  bucket = aws_s3_bucket.athena.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "athena" {
  bucket = aws_s3_bucket.athena.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "athena" {
  bucket = aws_s3_bucket.athena.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "athena" {
  bucket                  = aws_s3_bucket.athena.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_athena_database" "main" {
  name   = "${local.project}_athena_db"
  bucket = aws_s3_bucket.athena.id

  encryption_configuration {
    encryption_option = "SSE_KMS"
    kms_key           = module.athena_kms.key_id
  }

  lifecycle {
    ignore_changes = [bucket, encryption_configuration]
  }
}
