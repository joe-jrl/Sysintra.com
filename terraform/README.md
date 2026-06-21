# Terraform

This directory will hold the Terraform code for the Sysintra static site AWS deployment.

The initial structure is intentionally small:

- `examples/hello-world`: local Terraform CLI smoke test, with no AWS resources.
- `units/s3-bucket`: atomic S3 bucket unit for one static site bucket.
- `units/cloudfront-distribution`: atomic CloudFront distribution unit for one S3-backed static site.
- `units/s3-bucket-policy`: atomic bucket policy unit allowing one CloudFront distribution to read one private S3 bucket.
- `units/codebuild-service-role`: atomic CodeBuild service role unit with trust policy only.
- `units/codebuild-role-policies`: atomic IAM policy unit for production CodeBuild S3 deploy and CloudFront invalidation permissions.
- `units/codebuild-project`: atomic CodeBuild project unit for production CloudFront invalidation.
- `units/codepipeline-service-role`: atomic CodePipeline service role and IAM policy unit for production deployment.
- `units/codepipeline`: atomic production CodePipeline unit for manual deployment.

Future infrastructure will be added as atomic, parameterized units so staging and production can be deployed from the same Terraform code.
