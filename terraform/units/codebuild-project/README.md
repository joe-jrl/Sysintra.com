# CodeBuild Project Unit

Creates the production CodeBuild project that invalidates the production CloudFront distribution.

This unit intentionally does not create the CodeBuild service role, attach role policies, update CodePipeline, or deploy site content. Those are separate units.

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
