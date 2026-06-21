aws_region = "eu-west-1"
role_name  = "codebuild-annabelsblog-CloudFrontInvalidation-service-role"
role_path  = "/service-role/"

tags = {
  Environment = "Production"
  Project     = "annabelsblog"
  Purpose     = "CloudFront Invalidation"
  CreatedBy   = "Terraform"
}
