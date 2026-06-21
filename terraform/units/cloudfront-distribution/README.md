# CloudFront Distribution Unit

Creates one CloudFront distribution and one Origin Access Control for an S3-backed static site.

This unit intentionally does not configure ACM certificates, DNS, S3 bucket policies, or deployment orchestration. The ACM certificate ARN is provided as an input, and the S3 bucket policy should be added by a later atomic unit using this unit's distribution ARN output.

The configured aliases must all be covered by the supplied ACM certificate.

## Manual Test

Review `terraform.tfvars`, then run:

```sh
terraform init
terraform fmt -check
terraform validate
terraform plan
```

Apply only after checking the plan:

```sh
terraform apply
```

The `cloudfront_distribution_arn` output is required by the later S3 bucket policy unit.
