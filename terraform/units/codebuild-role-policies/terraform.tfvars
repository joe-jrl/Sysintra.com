aws_region     = "eu-west-1"
aws_account_id = "841708890209"

codebuild_role_name    = "codebuild-annabelsblog-CloudFrontInvalidation-service-role"
codebuild_project_name = "annabelsblog-CloudFrontInvalidation"

production_bucket_name     = "annabelsblog.co.uk"
production_distribution_id = "E3H799UTDH2DZG"
artifact_bucket_name       = "codepipeline-eu-west-1-2f2de99f0223-48f3-a5b2-b2ab9badbc0e"

policy_path = "/service-role/"

tags = {
  Environment = "Production"
  Project     = "annabelsblog"
  Purpose     = "CodeBuild Production Permissions"
  CreatedBy   = "Terraform"
}
