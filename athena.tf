resource "aws_s3_bucket" "athena" {
  bucket = "${local.name}-athena-results"
}

resource "aws_s3_bucket_acl" "athena" {
  bucket = aws_s3_bucket.athena.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.athena.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.athena.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_athena_database" "main" {
  name   = "${local.db_name}_athena_db"
  bucket = aws_s3_bucket.athena.id
}
