output "aws_ecr_repository_url" {
  value = aws_ecr_repository.main.repository_url
}

output "alb_hostname" {
  description = "URL of the ALB."
  value       = aws_lb.main.dns_name
}

output "athena_results_bucket" {
  description = "Name of the Athena bucket."
  value       = aws_s3_bucket.athena.bucket
}

output "cloudfront_domain_name" {
  description = "URL of the CloudFront distribution."
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "static_files_bucket" {
  description = "Name of the bucket for the static site files."
  value       = aws_s3_bucket.client.bucket
}
