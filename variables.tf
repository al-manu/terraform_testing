variable "TF_STATE_BUCKET" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
}
# variable "aws_region" {
#   description = "The AWS region for resources"
#   type        = string
# }

variable "in_bucket_name" {
  description = "Name of the input S3 bucket"
  type        = string
  default     = "test-in-oct241"  # Change this as needed for your environment
}

variable "out_bucket_name" {
  description = "Name of the output S3 bucket"
  type        = string
  default     = "test-out-oct241"  # Change this as needed for your environment
}

variable "tmp_bucket_name" {
  description = "Name of the temporary S3 bucket"
  type        = string
  default     = "test-tmp-oct241"  # Change this as needed for your environment
}

variable "export_bucket_name" {
  description = "Name of the export S3 bucket"
  type        = string
  default     = "test-export-oct241"  # Change this as needed for your environment
}
