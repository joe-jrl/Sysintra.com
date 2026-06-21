locals {
  pipeline_service_role_name = "AWSCodePipelineServiceRole-${var.aws_region}-${var.pipeline_name}"
  artifact_bucket_arn        = "arn:aws:s3:::${var.artifact_bucket_name}"
  production_bucket_arn      = "arn:aws:s3:::${var.production_bucket_name}"

  production_codebuild_project_arn = "arn:aws:codebuild:${var.aws_region}:${var.aws_account_id}:project/${var.production_codebuild_project_name}"
  site_builder_project_arn         = "arn:aws:codebuild:${var.aws_region}:${var.aws_account_id}:project/${var.site_builder_codebuild_project_name}"
  codestar_connection_arn          = "arn:aws:codestar-connections:${var.aws_region}:${var.aws_account_id}:connection/${var.codeconnection_id}"
}

data "aws_iam_policy_document" "codepipeline_assume_role" {
  statement {
    sid    = "CodePipelineTrustPolicy"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [var.aws_account_id]
    }
  }
}

resource "aws_iam_role" "production_pipeline_service_role" {
  name               = local.pipeline_service_role_name
  path               = var.role_path
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume_role.json

  tags = var.tags
}

data "aws_iam_policy_document" "artifact_access" {
  statement {
    sid    = "AllowS3BucketAccess"
    effect = "Allow"

    actions = [
      "s3:GetBucketVersioning",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
    ]

    resources = [local.artifact_bucket_arn]

    condition {
      test     = "StringEquals"
      variable = "aws:ResourceAccount"
      values   = [var.aws_account_id]
    }
  }

  statement {
    sid    = "AllowS3ObjectAccess"
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetObject",
      "s3:GetObjectVersion",
    ]

    resources = ["${local.artifact_bucket_arn}/*"]

    condition {
      test     = "StringEquals"
      variable = "aws:ResourceAccount"
      values   = [var.aws_account_id]
    }
  }
}

resource "aws_iam_policy" "production_pipeline_artifact_policy" {
  name        = local.pipeline_service_role_name
  path        = var.role_path
  description = "Policy for ${var.pipeline_name} to access artifact store"
  policy      = data.aws_iam_policy_document.artifact_access.json

  tags = var.tags
}

data "aws_iam_policy_document" "codeconnections_access" {
  statement {
    effect = "Allow"

    actions = [
      "codeconnections:UseConnection",
      "codestar-connections:UseConnection",
    ]

    resources = [
      var.codeconnection_arn,
      local.codestar_connection_arn,
    ]
  }
}

resource "aws_iam_policy" "production_pipeline_codeconnections_policy" {
  name        = "CodePipeline-CodeConnections-${var.aws_region}-${var.pipeline_name}"
  path        = var.role_path
  description = "Policy for ${var.pipeline_name} to access CodeConnections"
  policy      = data.aws_iam_policy_document.codeconnections_access.json

  tags = var.tags
}

data "aws_iam_policy_document" "s3_deploy_access" {
  statement {
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:PutObjectVersionAcl",
      "s3:DeleteObject",
      "s3:GetBucketVersioning",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
    ]

    resources = [
      local.production_bucket_arn,
      "${local.production_bucket_arn}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:ResourceAccount"
      values   = [var.aws_account_id]
    }
  }
}

resource "aws_iam_policy" "production_pipeline_s3deploy_policy" {
  name        = "CodePipeline-S3Deploy-${var.aws_region}-${var.pipeline_name}"
  path        = var.role_path
  description = "Policy for ${var.pipeline_name} to deploy to S3"
  policy      = data.aws_iam_policy_document.s3_deploy_access.json

  tags = var.tags
}

data "aws_iam_policy_document" "codebuild_access" {
  statement {
    effect = "Allow"

    actions = [
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild",
    ]

    resources = [
      local.production_codebuild_project_arn,
      local.site_builder_project_arn,
    ]
  }
}

resource "aws_iam_role_policy" "production_pipeline_codebuild_policy" {
  name   = "CodeBuildAccess"
  role   = aws_iam_role.production_pipeline_service_role.id
  policy = data.aws_iam_policy_document.codebuild_access.json
}

data "aws_iam_policy_document" "cloudfront_invalidation_codebuild_access" {
  statement {
    effect    = "Allow"
    actions   = ["codebuild:StartBuild"]
    resources = [local.production_codebuild_project_arn]
  }
}

resource "aws_iam_role_policy" "production_pipeline_cloudfront_invalidate_policy" {
  name   = "CloudFront-Invalidate"
  role   = aws_iam_role.production_pipeline_service_role.id
  policy = data.aws_iam_policy_document.cloudfront_invalidation_codebuild_access.json
}

resource "aws_iam_role_policy_attachment" "production_pipeline_artifact_attachment" {
  role       = aws_iam_role.production_pipeline_service_role.name
  policy_arn = aws_iam_policy.production_pipeline_artifact_policy.arn
}

resource "aws_iam_role_policy_attachment" "production_pipeline_codeconnections_attachment" {
  role       = aws_iam_role.production_pipeline_service_role.name
  policy_arn = aws_iam_policy.production_pipeline_codeconnections_policy.arn
}

resource "aws_iam_role_policy_attachment" "production_pipeline_s3deploy_attachment" {
  role       = aws_iam_role.production_pipeline_service_role.name
  policy_arn = aws_iam_policy.production_pipeline_s3deploy_policy.arn
}
