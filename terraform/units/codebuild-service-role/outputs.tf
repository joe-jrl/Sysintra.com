output "production_codebuild_role_name" {
  description = "Name of the production CodeBuild service role."
  value       = aws_iam_role.codebuild_production_invalidation_role.name
}

output "production_codebuild_role_arn" {
  description = "ARN of the production CodeBuild service role."
  value       = aws_iam_role.codebuild_production_invalidation_role.arn
}
