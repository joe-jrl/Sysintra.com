aws_region = "eu-west-1"

project_name        = "annabelsblog-CloudFrontInvalidation"
project_description = "CodeBuild project to invalidate CloudFront distribution for annabelsblog.co.uk production"
service_role_arn    = "arn:aws:iam::841708890209:role/service-role/codebuild-annabelsblog-CloudFrontInvalidation-service-role"

cloudfront_distribution_id = "E3H799UTDH2DZG"

compute_type                = "BUILD_GENERAL1_MEDIUM"
image                       = "aws/codebuild/amazonlinux-x86_64-standard:5.0"
environment_type            = "LINUX_CONTAINER"
image_pull_credentials_type = "CODEBUILD"
privileged_mode             = false

build_timeout  = 60
queued_timeout = 480

encryption_key     = "arn:aws:kms:eu-west-1:841708890209:alias/aws/s3"
badge_enabled      = false
project_visibility = "PRIVATE"

tags = {
  Environment = "Production"
  Project     = "annabelsblog"
  Purpose     = "CloudFront Invalidation"
  CreatedBy   = "Terraform"
}
