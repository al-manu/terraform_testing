in_bucket_name  = "test-in-dev-oct2401"
out_bucket_name = "test-out-dev-oct2401"
tmp_bucket_name = "test-tmp-dev-oct2401"
export_bucket_name = "test-export-dev-oct2401"
environment = "dev"
# TF_STATE_BUCKET   = "dev-terraform-state-bucket"       # Dev-specific S3 bucket for state
TF_STATE_LOCK_TABLE = "terraform-lock-dev"             # Dev-specific DynamoDB table for locking
# AWS_REGION = "us-east-1"