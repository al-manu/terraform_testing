in_bucket_name  = "test-in-sit-oct2401"
out_bucket_name = "test-out-sit-oct2401"
tmp_bucket_name = "test-tmp-sit-oct2401"
export_bucket_name = "test-export-sit-oct2401"
environment = "sit"
# sit.tfvars
# TF_STATE_BUCKET   = "sit-terraform-state-bucket"       # Sit-specific S3 bucket for state
# TF_STATE_LOCK_TABLE = "terraform-lock-sit"             # Sit-specific DynamoDB table for locking
tf_state_bucket   = "my-terraform-state-sit"  # Unique S3 bucket for sit
tf_state_lock_table = "my-terraform-lock-table-sit"  # Unique lock object in S3 for sit