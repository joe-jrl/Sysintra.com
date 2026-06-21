# S3 Bucket Policy Unit

Applies the S3 bucket policy that allows one CloudFront distribution to read objects from one private S3 bucket.

This unit intentionally does not create the S3 bucket, CloudFront distribution, Origin Access Control, DNS, certificates, or deployment orchestration. Those are separate units.

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
