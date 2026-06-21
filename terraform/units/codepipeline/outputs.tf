output "production_pipeline_name" {
  description = "Name of the production pipeline."
  value       = aws_codepipeline.production_pipeline.name
}

output "production_pipeline_arn" {
  description = "ARN of the production pipeline."
  value       = aws_codepipeline.production_pipeline.arn
}

output "production_pipeline_console_url" {
  description = "Direct link to production pipeline in AWS Console."
  value       = "https://${var.aws_region}.console.aws.amazon.com/codesuite/codepipeline/pipelines/${aws_codepipeline.production_pipeline.name}/view?region=${var.aws_region}"
}

output "production_pipeline_execution_url" {
  description = "Direct link to production pipeline executions in AWS Console."
  value       = "https://${var.aws_region}.console.aws.amazon.com/codesuite/codepipeline/pipelines/${aws_codepipeline.production_pipeline.name}/executions?region=${var.aws_region}"
}
