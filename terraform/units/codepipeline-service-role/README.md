# CodePipeline Service Role Unit

Creates the production CodePipeline service role and production-scoped IAM policies for the `annabelsblog-pipeline`.

This unit intentionally does not create the CodePipeline pipeline itself. The pipeline resource should be added by a later atomic unit.

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
