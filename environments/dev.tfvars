in_bucket_name  = "test-in-dev-oct2401"
out_bucket_name = "test-out-dev-oct2401"
tmp_bucket_name = "test-tmp-dev-oct2401"
export_bucket_name = "test-export-dev-oct2401"
environment = "dev"
# # TF_STATE_BUCKET   = "dev-terraform-state-bucket"       # Dev-specific S3 bucket for state
# TF_STATE_LOCK_TABLE = "terraform-lock-dev"             # Dev-specific DynamoDB table for locking
# AWS_REGION = "us-east-1"
# tf_state_bucket   = "my-terraform-state-dev"  # Unique S3 bucket for dev
# tf_state_lock_table = "my-terraform-lock-table-dev"  # Unique lock object in S3 for dev

# S3 bucket name for storing Terraform state
state_bucket_name = "my-terraform-state-dev"

# S3 bucket name for locking Terraform state
lock_bucket_name = "my-terraform-lock-dev"

# Optional: Enable encryption for state bucket
enable_encryption = true

# Optional: Enable versioning for state bucket
enable_versioning = true