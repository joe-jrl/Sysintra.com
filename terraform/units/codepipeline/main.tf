resource "aws_codepipeline" "production_pipeline" {
  name     = var.pipeline_name
  role_arn = var.pipeline_service_role_arn

  tags = var.tags

  artifact_store {
    location = var.artifact_bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        ConnectionArn        = var.codeconnection_arn
        FullRepositoryId     = var.source_repo
        BranchName           = var.source_branch
        OutputArtifactFormat = "CODE_ZIP"
        DetectChanges        = "false"
      }
    }
  }

  stage {
    name = "reshape-artefacts"

    action {
      name             = "reshape-artefacts"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtefact"]

      configuration = {
        ProjectName = var.site_builder_codebuild_project_name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      version         = "1"
      input_artifacts = ["BuildArtefact"]

      configuration = {
        BucketName = var.production_bucket_name
        Extract    = "true"
      }
    }
  }

  stage {
    name = "CloudFront-Invalidate"

    action {
      name            = "InvalidateCloudFront"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      input_artifacts = ["SourceArtifact"]

      configuration = {
        ProjectName = var.production_codebuild_project_name
      }
    }
  }
}
