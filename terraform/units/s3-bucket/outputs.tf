output "bucket_name" {
  description = "Name of the created S3 bucket."
  value       = aws_s3_bucket.website_bucket.id
}

output "bucket_arn" {
  description = "ARN of the created S3 bucket."
  value       = aws_s3_bucket.website_bucket.arn
}

output "bucket_domain_name" {
  description = "Global domain name of the S3 bucket."
  value       = aws_s3_bucket.website_bucket.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "Regional domain name of the S3 bucket for CloudFront origin configuration."
  value       = aws_s3_bucket.website_bucket.bucket_regional_domain_name
}
