variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

