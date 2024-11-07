# backend.tf: Configure S3 as the backend for both state storage and locking

# terraform {
#   backend "s3" {
#     bucket         = var.tf_state_bucket  # S3 bucket to store state
#     key            = "terraform/dev/terraform.tfstate"  # State file path per environment
#     region         = var.aws_region  # AWS region where the bucket is located
#     encrypt        = true  # Enable encryption for the state file
#     acl            = "bucket-owner-full-control"  # Grant full control to the bucket owner
#     lock_table     = "terraform-lock-table"  # Use the S3 locking mechanism (no need for DynamoDB)
#   }
# }

terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "terraform/state/${terraform.workspace}.tfstate"   # Using workspace to separate dev, prod, sit states
    # region = "us-west-2"
    encrypt = true
    acl    = "bucket-owner-full-control"
    # Locking via Object Locking (optional but recommended for compliance mode)
    object_locking = true
  }
}
