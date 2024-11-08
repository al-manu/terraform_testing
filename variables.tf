variable "environment" {
  description = "The environment to deploy to (dev, sit, prod)"
  type        = string
}

variable "in_bucket_name" {
  description = "Name of the input S3 bucket"
  type        = string
}

variable "out_bucket_name" {
  description = "Name of the output S3 bucket"
  type        = string
}

variable "tmp_bucket_name" {
  description = "Name of the temporary S3 bucket"
  type        = string
}

variable "export_bucket_name" {
  description = "Name of the export S3 bucket"
  type        = string
}


# variable "TF_STATE_BUCKET" {
#   description = "The S3 bucket to store Terraform state files"
#   type        = string
# }


# variables.tf: Declare variables for backend configuration

# variable "environment" {
#   description = "The environment for the backend (dev, sit, prod)"
#   type        = string
# }

# variable "aws_region" {
#   description = "The AWS region where the backend resources are stored"
#   type        = string
# }

variable "tf_state_bucket" {
  description = "The S3 bucket to store Terraform state files"
  type        = string
}

variable "tf_state_lock_table" {
  description = "The lock table for Terraform state locking in S3"
  type        = string
  default     = "terraform-lock-table"  # This is the default lock table if not specified in `.tfvars`
}
