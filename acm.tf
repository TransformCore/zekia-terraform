resource "aws_acm_certificate" "root" {
  provider          = aws.cloudfront
  domain_name       = local.domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "wildcard" {
  domain_name       = "*.${local.domain}"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "root" {
  provider                = aws.cloudfront
  certificate_arn         = aws_acm_certificate.root.arn
  validation_record_fqdns = [for record in aws_route53_record.root_validation : record.fqdn]

  timeouts {
    create = "5m"
  }
}

resource "aws_acm_certificate_validation" "wildcard" {
  certificate_arn         = aws_acm_certificate.wildcard.arn
  validation_record_fqdns = [for record in aws_route53_record.wildcard_validation : record.fqdn]

  timeouts {
    create = "5m"
  }
}
