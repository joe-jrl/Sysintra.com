variable "aws_region" {
  description = "AWS provider region. CloudFront is global, but the provider still requires a region."
  type        = string
  default     = "eu-west-1"
}

variable "domain_name" {
  description = "Custom domain name attached to the CloudFront distribution."
  type        = string
}

variable "aliases" {
  description = "Custom domain names attached to the CloudFront distribution. These must be covered by the ACM certificate."
  type        = list(string)
}

variable "bucket_name" {
  description = "Name of the S3 origin bucket."
  type        = string
}

variable "bucket_region" {
  description = "AWS region where the S3 origin bucket exists."
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for the custom domain. CloudFront requires this certificate to be in us-east-1."
  type        = string
}

variable "default_root_object" {
  description = "Object CloudFront returns when the request points at the distribution root."
  type        = string
  default     = "index.html"
}

variable "enabled" {
  description = "Whether the CloudFront distribution is enabled."
  type        = bool
  default     = true
}

variable "price_class" {
  description = "CloudFront price class."
  type        = string
  default     = "PriceClass_All"
}

variable "http_version" {
  description = "Maximum HTTP version supported by the distribution."
  type        = string
  default     = "http2"
}

variable "ipv6_enabled" {
  description = "Whether IPv6 is enabled for the distribution."
  type        = bool
  default     = true
}

variable "cache_policy_id" {
  description = "CloudFront cache policy ID for the default cache behavior."
  type        = string
  default     = "658327ea-f89d-4fab-a63d-7e88639e58f6"
}

variable "tags" {
  description = "Tags to apply to the CloudFront distribution."
  type        = map(string)
  default     = {}
}
