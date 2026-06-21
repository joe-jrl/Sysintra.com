# S3 Bucket Unit

Creates one private S3 bucket suitable for use as a CloudFront origin for the static site.

This unit intentionally does not configure CloudFront, ACM, DNS, bucket policies, or deployment orchestration. Those should be added as separate atomic units.

## Files

- `versions.tf`: Terraform and provider requirements.
- `variables.tf`: Parameter surface for this unit.
- `main.tf`: S3 resources.
- `outputs.tf`: Values needed by later units.
- `terraform.tfvars.example`: Example parameter set for manual testing.

## Manual Test

Copy the example vars file, choose a globally unique bucket name, then run:

```sh
terraform init
terraform fmt -check
terraform validate
terraform plan -var-file=terraform.tfvars
```

Apply only after checking the plan:

```sh
terraform apply -var-file=terraform.tfvars
```

The bucket is private by default, blocks public access, uses S3-managed encryption with bucket keys enabled, and enforces bucket-owner object ownership.
