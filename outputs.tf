output "aws_ecr_repository_url" {
  value = aws_ecr_repository.main.repository_url
}

output "alb_hostname" {
  description = "URL of the ALB."
  value       = aws_lb.main.dns_name
}
