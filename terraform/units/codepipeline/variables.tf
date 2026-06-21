variable "aws_region" {
  description = "AWS region for the CodePipeline."
  type        = string
  default     = "eu-west-1"
}

variable "pipeline_name" {
  description = "Name of the production CodePipeline."
  type        = string
}

variable "pipeline_service_role_arn" {
  description = "ARN of the production CodePipeline service role."
  type        = string
}

variable "production_bucket_name" {
  description = "Name of the production S3 deploy bucket."
  type        = string
}

variable "production_codebuild_project_name" {
  description = "Name of the production CloudFront invalidation CodeBuild project."
  type        = string
}

variable "site_builder_codebuild_project_name" {
  description = "Name of the site builder CodeBuild project."
  type        = string
}

variable "artifact_bucket_name" {
  description = "Name of the CodePipeline artifact bucket."
  type        = string
}

variable "codeconnection_arn" {
  description = "ARN of the CodeConnections connection used by the source action."
  type        = string
}

variable "source_repo" {
  description = "Full repository ID for the CodeConnections source action."
  type        = string
}

variable "source_branch" {
  description = "Branch name for the CodeConnections source action."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the CodePipeline."
  type        = map(string)
  default     = {}
}
