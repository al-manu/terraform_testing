in_bucket_name  = "test-in-prod-oct2401"
out_bucket_name = "test-out-prod-oct2401"
tmp_bucket_name = "test-tmp-prod-oct2401"
export_bucket_name = "test-export-prod-oct2401"
environment = "prod"
# prod.tfvars
# TF_STATE_BUCKET   = "prod-terraform-state-bucket"      # Prod-specific S3 bucket for state
# TF_STATE_LOCK_TABLE = "terraform-lock-prod"            # Prod-specific DynamoDB table for locking
tf_state_bucket   = "my-terraform-state-prod"  # Unique S3 bucket for prod
tf_state_lock_table = "my-terraform-lock-table-prod"  # Unique lock object in S3 for prod