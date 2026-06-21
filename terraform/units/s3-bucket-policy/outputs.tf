output "bucket_name" {
  description = "Name of the S3 bucket with the applied policy."
  value       = aws_s3_bucket_policy.cloudfront_private_content.bucket
}

output "bucket_policy_id" {
  description = "ID of the S3 bucket policy resource."
  value       = aws_s3_bucket_policy.cloudfront_private_content.id
}

output "cloudfront_distribution_arn" {
  description = "CloudFront distribution ARN allowed by the bucket policy."
  value       = var.cloudfront_distribution_arn
}
