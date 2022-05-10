resource "aws_s3_bucket" "client" {
  bucket = "${local.name}-webapp.example.com"
}

resource "aws_s3_bucket_acl" "client" {
  bucket = aws_s3_bucket.client.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "client" {
  bucket = aws_s3_bucket.client

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
