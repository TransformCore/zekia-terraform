data "aws_s3_bucket" "billing_data_bucket" {
  bucket = "internal-cloud-carbon-footprint-billing-data"
}


#  state bucket

resource "aws_s3_bucket" "ccf_terraform_state" {
  bucket = var.terraform_state_bucket
}

resource "aws_s3_bucket_versioning" "ccf_terraform_state_versioning" {
  bucket = aws_s3_bucket.ccf_terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ccf_terraform_state_encryption" {
  bucket = aws_s3_bucket.ccf_terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


# athena bucket

resource "aws_s3_bucket" "athena_query_results_bucket" {
  bucket = var.athena_query_results_bucket
}

resource "aws_s3_bucket_versioning" "athena_bucket_versioning" {
  bucket = aws_s3_bucket.athena_query_results_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "athena_bucket_encryption" {
  bucket = aws_s3_bucket.athena_query_results_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_athena_database" "athena_db" {
  name   = "ccf_athena"
  bucket = aws_s3_bucket.athena_query_results_bucket.id
}
