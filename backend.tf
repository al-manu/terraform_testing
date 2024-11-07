# backend.tf: Configure S3 as the backend for both state storage and locking

terraform {
  backend "s3" {
    bucket         = var.tf_state_bucket  # S3 bucket to store state
    key            = "terraform/${var.environment}/terraform.tfstate"  # State file path per environment
    region         = var.aws_region  # AWS region where the bucket is located
    encrypt        = true  # Enable encryption for the state file
    acl            = "bucket-owner-full-control"  # Grant full control to the bucket owner
    lock_table     = "terraform-lock-table"  # Use the S3 locking mechanism (no need for DynamoDB)
  }
}
