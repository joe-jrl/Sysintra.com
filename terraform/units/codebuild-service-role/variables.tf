variable "aws_region" {
  description = "AWS region for the IAM role provider."
  type        = string
  default     = "eu-west-1"
}

variable "role_name" {
  description = "Name of the CodeBuild service role."
  type        = string
}

variable "role_path" {
  description = "Path for the CodeBuild service role."
  type        = string
  default     = "/service-role/"
}

variable "tags" {
  description = "Tags to apply to the CodeBuild service role."
  type        = map(string)
  default     = {}
}
