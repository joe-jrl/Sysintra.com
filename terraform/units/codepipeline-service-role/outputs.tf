output "production_pipeline_service_role_arn" {
  description = "ARN of the production pipeline service role."
  value       = aws_iam_role.production_pipeline_service_role.arn
}

output "production_pipeline_service_role_name" {
  description = "Name of the production pipeline service role."
  value       = aws_iam_role.production_pipeline_service_role.name
}

output "production_pipeline_artifact_policy_arn" {
  description = "ARN of the production pipeline artifact access policy."
  value       = aws_iam_policy.production_pipeline_artifact_policy.arn
}

output "production_pipeline_codeconnections_policy_arn" {
  description = "ARN of the production pipeline CodeConnections access policy."
  value       = aws_iam_policy.production_pipeline_codeconnections_policy.arn
}

output "production_pipeline_s3deploy_policy_arn" {
  description = "ARN of the production pipeline S3 deploy policy."
  value       = aws_iam_policy.production_pipeline_s3deploy_policy.arn
}

output "production_pipeline_policy_attachment_ids" {
  description = "IDs of the production pipeline managed policy attachments."
  value = {
    artifact        = aws_iam_role_policy_attachment.production_pipeline_artifact_attachment.id
    codeconnections = aws_iam_role_policy_attachment.production_pipeline_codeconnections_attachment.id
    s3deploy        = aws_iam_role_policy_attachment.production_pipeline_s3deploy_attachment.id
  }
}
