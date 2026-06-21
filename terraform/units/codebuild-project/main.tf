locals {
  buildspec = <<-EOT
    version: 0.2

    phases:
      build:
        commands:
          - aws cloudfront create-invalidation --distribution-id ${var.cloudfront_distribution_id} --paths "/*"
  EOT
}

resource "aws_codebuild_project" "production_cloudfront_invalidation" {
  name               = var.project_name
  description        = var.project_description
  service_role       = var.service_role_arn
  build_timeout      = var.build_timeout
  queued_timeout     = var.queued_timeout
  encryption_key     = var.encryption_key
  badge_enabled      = var.badge_enabled
  project_visibility = var.project_visibility

  source {
    type         = "CODEPIPELINE"
    insecure_ssl = false
    buildspec    = local.buildspec
  }

  environment {
    compute_type                = var.compute_type
    image                       = var.image
    type                        = var.environment_type
    image_pull_credentials_type = var.image_pull_credentials_type
    privileged_mode             = var.privileged_mode
  }

  artifacts {
    type                = "CODEPIPELINE"
    name                = var.project_name
    packaging           = "NONE"
    encryption_disabled = false
  }

  cache {
    type = "NO_CACHE"
  }

  logs_config {
    cloudwatch_logs {
      status = "DISABLED"
    }

    s3_logs {
      status              = "DISABLED"
      encryption_disabled = false
    }
  }

  tags = var.tags
}
