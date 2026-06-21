aws_region = "eu-west-1"

pipeline_name             = "annabelsblog-pipeline"
pipeline_service_role_arn = "arn:aws:iam::841708890209:role/service-role/AWSCodePipelineServiceRole-eu-west-1-annabelsblog-pipeline"

production_bucket_name              = "annabelsblog.co.uk"
production_codebuild_project_name   = "annabelsblog-CloudFrontInvalidation"
site_builder_codebuild_project_name = "sysintra-site-builder"

artifact_bucket_name = "codepipeline-eu-west-1-2f2de99f0223-48f3-a5b2-b2ab9badbc0e"
codeconnection_arn   = "arn:aws:codeconnections:eu-west-1:841708890209:connection/369da99f-a66a-4bfe-9f02-5f6c40dcb8cc"
source_repo          = "joe-jrl/Sysintra.com"
source_branch        = "main"

tags = {
  Environment = "Production"
  Project     = "annabelsblog"
  Purpose     = "Production Deployment Pipeline"
  CreatedBy   = "Terraform"
}
