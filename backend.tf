
terraform {
  backend "s3" {
    bucket         = var.state_bucket  # S3 bucket to store state
    key            = "terraform/dev/terraform.tfstate"  # State file path per environment
    region         = var.aws_region  # AWS region where the bucket is located
    encrypt        = true  # Enable encryption for the state file
    acl            = "bucket-owner-full-control"  # Grant full control to the bucket owner
    lock_table     = var.lock_bucket  # Use the S3 locking mechanism (no need for DynamoDB)
  }
}



# backend.tf: Configure S3 as the backend for both state storage and locking


# terraform {
#   backend "s3" {
#     bucket = "your-terraform-state-bucket"
#     key    = "terraform/state/${terraform.workspace}.tfstate"   # Using workspace to separate dev, prod, sit states
#     # region = "us-west-2"
#     encrypt = true
#     acl    = "bucket-owner-full-control"
#     # Locking via Object Locking (optional but recommended for compliance mode)
#     object_locking = true
#   }
# }

# variable "environment" {
#   description = "The environment to deploy to (dev, sit, prod)"
#   type        = string
# }

# variable "aws_region" {
#   description = "The AWS region where the backend resources are stored"
#   type        = string
# }


# terraform {
#   backend "s3" {
#     bucket = "my-terraform-state-bucket"
#     key    = "terraform/dev/dev.tfstate"
#     region = "us-west-2"
#     encrypt = true
#   }
# }
