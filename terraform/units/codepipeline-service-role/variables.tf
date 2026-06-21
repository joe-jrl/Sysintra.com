variable "aws_region" {
  description = "AWS region for the CodePipeline service role policies."
  type        = string
  default     = "eu-west-1"
}

variable "aws_account_id" {
  description = "AWS account ID that owns the production resources."
  type        = string
}

variable "pipeline_name" {
  description = "Name of the production CodePipeline pipeline."
  type        = string
}

variable "role_path" {
  description = "IAM path for the CodePipeline service role and managed policies."
  type        = string
  default     = "/service-role/"
}

variable "production_bucket_name" {
  description = "Name of the production S3 bucket."
  type        = string
}

variable "artifact_bucket_name" {
  description = "Name of the CodePipeline artifact bucket."
  type        = string
}

variable "codeconnection_arn" {
  description = "ARN of the CodeConnections connection used by the pipeline source action."
  type        = string
}

variable "codeconnection_id" {
  description = "ID of the CodeConnections connection, used to construct the legacy codestar-connections ARN."
  type        = string
}

variable "production_codebuild_project_name" {
  description = "Name of the production CloudFront invalidation CodeBuild project."
  type        = string
}

variable "site_builder_codebuild_project_name" {
  description = "Name of the site builder CodeBuild project used by the production pipeline."
  type        = string
}

variable "tags" {
  description = "Tags to apply to IAM resources created by this unit."
  type        = map(string)
  default     = {}
}
