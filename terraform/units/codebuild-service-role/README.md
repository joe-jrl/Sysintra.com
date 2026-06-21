# CodeBuild Service Role Unit

Creates a minimal CodeBuild service role for the production CloudFront invalidation build.

This unit intentionally attaches no permissions. Permissions are added by later atomic units.

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
