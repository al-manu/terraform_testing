in_bucket_name  = "test-in-prod-oct2401"
out_bucket_name = "test-out-prod-oct2401"
tmp_bucket_name = "test-tmp-prod-oct2401"
export_bucket_name = "test-export-prod-oct2401"
environment = "prod"
# prod.tfvars
environment       = "prod"
TF_STATE_BUCKET   = "prod-terraform-state-bucket"      # Prod-specific S3 bucket for state
TF_STATE_LOCK_TABLE = "terraform-lock-prod"            # Prod-specific DynamoDB table for locking
