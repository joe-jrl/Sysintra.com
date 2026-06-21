output "codebuild_base_policy_arn" {
  description = "ARN of the CodeBuild base policy."
  value       = aws_iam_policy.codebuild_production_base_policy.arn
}

output "codebuild_s3_policy_arn" {
  description = "ARN of the CodeBuild S3 deploy policy."
  value       = aws_iam_policy.codebuild_production_s3_policy.arn
}

output "codebuild_cloudfront_policy_arn" {
  description = "ARN of the CodeBuild CloudFront invalidation policy."
  value       = aws_iam_policy.codebuild_production_cloudfront_policy.arn
}

output "policy_attachment_ids" {
  description = "IDs of the policy attachments."
  value = {
    base_attachment       = aws_iam_role_policy_attachment.codebuild_base_attachment.id
    s3_attachment         = aws_iam_role_policy_attachment.codebuild_s3_attachment.id
    cloudfront_attachment = aws_iam_role_policy_attachment.codebuild_cloudfront_attachment.id
  }
}
