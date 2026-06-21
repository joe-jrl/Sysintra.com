variable "aws_region" {
  description = "AWS region for regional IAM policy resources."
  type        = string
  default     = "eu-west-1"
}

variable "aws_account_id" {
  description = "AWS account ID that owns the production resources."
  type        = string
}

variable "codebuild_role_name" {
  description = "Name of the production CodeBuild service role to attach policies to."
  type        = string
}

variable "codebuild_project_name" {
  description = "Name of the production CodeBuild project."
  type        = string
}

variable "production_bucket_name" {
  description = "Name of the production S3 bucket."
  type        = string
}

variable "production_distribution_id" {
  description = "ID of the production CloudFront distribution."
  type        = string
}

variable "artifact_bucket_name" {
  description = "Name of the CodePipeline artifact bucket used by the production CodeBuild project."
  type        = string
}

variable "policy_path" {
  description = "IAM path for managed policies created by this unit."
  type        = string
  default     = "/service-role/"
}

variable "tags" {
  description = "Tags to apply to managed IAM policies."
  type        = map(string)
  default     = {}
}
