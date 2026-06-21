output "production_codebuild_project_name" {
  description = "Name of the production CodeBuild project."
  value       = aws_codebuild_project.production_cloudfront_invalidation.name
}

output "production_codebuild_project_arn" {
  description = "ARN of the production CodeBuild project."
  value       = aws_codebuild_project.production_cloudfront_invalidation.arn
}

output "production_codebuild_buildspec" {
  description = "Buildspec content for verification."
  value       = aws_codebuild_project.production_cloudfront_invalidation.source[0].buildspec
}
