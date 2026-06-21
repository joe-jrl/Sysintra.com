variable "aws_region" {
  description = "AWS region for the CodeBuild project."
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Name of the production CodeBuild project."
  type        = string
}

variable "project_description" {
  description = "Description for the production CodeBuild project."
  type        = string
}

variable "service_role_arn" {
  description = "ARN of the production CodeBuild service role."
  type        = string
}

variable "cloudfront_distribution_id" {
  description = "Production CloudFront distribution ID to invalidate."
  type        = string
}

variable "compute_type" {
  description = "CodeBuild compute type."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

variable "image" {
  description = "CodeBuild image."
  type        = string
  default     = "aws/codebuild/amazonlinux-x86_64-standard:5.0"
}

variable "environment_type" {
  description = "CodeBuild environment type."
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "image_pull_credentials_type" {
  description = "CodeBuild image pull credentials type."
  type        = string
  default     = "CODEBUILD"
}

variable "privileged_mode" {
  description = "Whether privileged mode is enabled for the build container."
  type        = bool
  default     = false
}

variable "build_timeout" {
  description = "Build timeout in minutes."
  type        = number
  default     = 60
}

variable "queued_timeout" {
  description = "Queued timeout in minutes."
  type        = number
  default     = 480
}

variable "encryption_key" {
  description = "KMS key ARN or alias used by the CodeBuild project."
  type        = string
}

variable "badge_enabled" {
  description = "Whether CodeBuild badge generation is enabled."
  type        = bool
  default     = false
}

variable "project_visibility" {
  description = "Visibility of the CodeBuild project."
  type        = string
  default     = "PRIVATE"
}

variable "tags" {
  description = "Tags to apply to the CodeBuild project."
  type        = map(string)
  default     = {}
}
