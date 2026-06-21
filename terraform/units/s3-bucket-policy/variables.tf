variable "aws_region" {
  description = "AWS region for the S3 bucket."
  type        = string
  default     = "eu-west-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket receiving the policy."
  type        = string
}

variable "bucket_arn" {
  description = "ARN of the S3 bucket receiving the policy."
  type        = string
}

variable "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution allowed to read objects from the bucket."
  type        = string
}
