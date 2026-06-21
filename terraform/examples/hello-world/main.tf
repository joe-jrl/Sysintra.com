terraform {
  required_version = ">= 1.15.0"
}

variable "environment" {
  description = "Deployment environment name used by the hello-world smoke test."
  type        = string
  default     = "local"
}

output "message" {
  value = "hello world from terraform for ${var.environment}"
}
