output "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution. Required by the later S3 bucket policy unit."
  value       = aws_cloudfront_distribution.website.arn
}

output "cloudfront_distribution_domain_name" {
  description = "CloudFront domain name used by external DNS."
  value       = aws_cloudfront_distribution.website.domain_name
}

output "cloudfront_distribution_hosted_zone_id" {
  description = "CloudFront hosted zone ID."
  value       = aws_cloudfront_distribution.website.hosted_zone_id
}

output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution."
  value       = aws_cloudfront_distribution.website.id
}

output "origin_access_control_id" {
  description = "ID of the CloudFront Origin Access Control."
  value       = aws_cloudfront_origin_access_control.website_bucket.id
}

output "origin_domain_name" {
  description = "Derived S3 origin domain name used by this distribution."
  value       = local.origin_domain_name
}
