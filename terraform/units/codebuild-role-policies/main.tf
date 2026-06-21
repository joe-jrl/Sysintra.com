locals {
  codebuild_log_group_arn        = "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:/aws/codebuild/${var.codebuild_project_name}"
  codebuild_report_group_arn     = "arn:aws:codebuild:${var.aws_region}:${var.aws_account_id}:report-group/${var.codebuild_project_name}-*"
  production_bucket_arn          = "arn:aws:s3:::${var.production_bucket_name}"
  production_distribution_arn    = "arn:aws:cloudfront::${var.aws_account_id}:distribution/${var.production_distribution_id}"
  artifact_bucket_arn            = "arn:aws:s3:::${var.artifact_bucket_name}"
  base_policy_name               = "CodeBuildBasePolicy-${var.codebuild_project_name}-${var.aws_region}"
  production_s3_policy_name      = "CodeBuild-S3Deploy-Production-annabelsblog"
  cloudfront_invalidation_policy = "CodeBuild-CloudFrontInvalidation-Production-annabelsblog"
}

data "aws_iam_policy_document" "codebuild_base" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      local.codebuild_log_group_arn,
      "${local.codebuild_log_group_arn}:*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
    ]

    resources = [
      local.artifact_bucket_arn,
      "${local.artifact_bucket_arn}/*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "codebuild:CreateReportGroup",
      "codebuild:CreateReport",
      "codebuild:UpdateReport",
      "codebuild:BatchPutTestCases",
      "codebuild:BatchPutCodeCoverages",
    ]

    resources = [local.codebuild_report_group_arn]
  }
}

resource "aws_iam_policy" "codebuild_production_base_policy" {
  name        = local.base_policy_name
  path        = var.policy_path
  description = "Base policy for annabelsblog production CloudFront invalidation CodeBuild project"
  policy      = data.aws_iam_policy_document.codebuild_base.json

  tags = var.tags
}

data "aws_iam_policy_document" "production_s3_deploy" {
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
      "s3:GetObject",
      "s3:GetObjectVersion",
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

resource "aws_iam_policy" "codebuild_production_s3_policy" {
  name        = local.production_s3_policy_name
  path        = var.policy_path
  description = "Policy for CodeBuild to access production S3 bucket ${var.production_bucket_name}"
  policy      = data.aws_iam_policy_document.production_s3_deploy.json

  tags = var.tags
}

data "aws_iam_policy_document" "production_cloudfront_invalidation" {
  statement {
    effect = "Allow"

    actions = ["cloudfront:CreateInvalidation"]

    resources = [local.production_distribution_arn]
  }
}

resource "aws_iam_policy" "codebuild_production_cloudfront_policy" {
  name        = local.cloudfront_invalidation_policy
  path        = var.policy_path
  description = "Policy for CodeBuild to invalidate production CloudFront distribution ${var.production_distribution_id}"
  policy      = data.aws_iam_policy_document.production_cloudfront_invalidation.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "codebuild_base_attachment" {
  role       = var.codebuild_role_name
  policy_arn = aws_iam_policy.codebuild_production_base_policy.arn
}

resource "aws_iam_role_policy_attachment" "codebuild_s3_attachment" {
  role       = var.codebuild_role_name
  policy_arn = aws_iam_policy.codebuild_production_s3_policy.arn
}

resource "aws_iam_role_policy_attachment" "codebuild_cloudfront_attachment" {
  role       = var.codebuild_role_name
  policy_arn = aws_iam_policy.codebuild_production_cloudfront_policy.arn
}
