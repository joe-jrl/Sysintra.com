aws_region     = "eu-west-1"
aws_account_id = "841708890209"

pipeline_name = "annabelsblog-pipeline"
role_path     = "/service-role/"

production_bucket_name = "annabelsblog.co.uk"
artifact_bucket_name   = "codepipeline-eu-west-1-2f2de99f0223-48f3-a5b2-b2ab9badbc0e"

codeconnection_arn = "arn:aws:codeconnections:eu-west-1:841708890209:connection/369da99f-a66a-4bfe-9f02-5f6c40dcb8cc"
codeconnection_id  = "369da99f-a66a-4bfe-9f02-5f6c40dcb8cc"

production_codebuild_project_name   = "annabelsblog-CloudFrontInvalidation"
site_builder_codebuild_project_name = "sysintra-site-builder"

tags = {
  Environment = "Production"
  Project     = "annabelsblog"
  Purpose     = "CodePipeline Service Role"
  CreatedBy   = "Terraform"
}
