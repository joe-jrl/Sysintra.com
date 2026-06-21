locals {
  origin_domain_name = "${var.bucket_name}.s3.${var.bucket_region}.amazonaws.com"
}

resource "aws_cloudfront_origin_access_control" "website_bucket" {
  name                              = local.origin_domain_name
  description                       = "Origin access control for ${local.origin_domain_name}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "website" {
  aliases             = var.aliases
  comment             = var.domain_name
  default_root_object = var.default_root_object
  enabled             = var.enabled
  http_version        = var.http_version
  is_ipv6_enabled     = var.ipv6_enabled
  price_class         = var.price_class

  origin {
    connection_attempts      = 3
    connection_timeout       = 10
    domain_name              = local.origin_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.website_bucket.id
    origin_id                = local.origin_domain_name

    s3_origin_config {
      origin_access_identity = ""
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = var.cache_policy_id
    compress               = true
    target_origin_id       = local.origin_domain_name
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate_arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }

  tags = var.tags
}
