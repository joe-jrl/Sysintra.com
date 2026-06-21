# CodeBuild Role Policies Unit

Creates and attaches production-scoped IAM policies for the production CodeBuild role.

This unit intentionally does not create the CodeBuild role or CodeBuild project. The role must already exist before this unit is applied.

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
