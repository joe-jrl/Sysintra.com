# CodePipeline Unit

Creates the production CodePipeline for manual deployment to `annabelsblog.co.uk`.

This unit intentionally does not create service roles, policies, buckets, CloudFront distributions, or CodeBuild projects. Those are separate units.

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

The source action has `DetectChanges = "false"` so the pipeline is manually triggered.
