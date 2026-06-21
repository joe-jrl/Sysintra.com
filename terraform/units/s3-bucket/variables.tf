variable "aws_region" {
  description = "AWS region where the S3 bucket is created."
  type        = string
  default     = "eu-west-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket. For this site, this normally matches the site domain or subdomain."
  type        = string
}

variable "force_destroy" {
  description = "When true, Terraform can delete the bucket even if it contains objects. Keep false for persistent site buckets."
  type        = bool
  default     = false
}

variable "bucket_tags" {
  description = "Tags to apply to the S3 bucket."
  type        = map(string)
  default = {
    site = ""
  }
}
