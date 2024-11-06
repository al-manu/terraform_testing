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


variable "TF_STATE_BUCKET" {
  description = "The S3 bucket to store Terraform state files"
  type        = string
}

variable "TF_STATE_LOCK_TABLE" {
  description = "The DynamoDB table used for state locking"
  type        = string
}