# bootstrap.tf
# provider "aws" {
#   region = var.aws_region
# }

# Create state bucket for the specific environment
resource "aws_s3_bucket" "state_bucket" {
  count  = length(data.aws_s3_bucket.state_bucket_check) == 0 ? 1 : 0
  bucket = "dw-test-state-${var.environment}"
  acl    = "private"
}

# Create lock bucket for the specific environment
resource "aws_s3_bucket" "lock_bucket" {
  count  = length(data.aws_s3_bucket.lock_bucket_check) == 0 ? 1 : 0
  bucket = "dw-test-lock-${var.environment}"
  acl    = "private"
}

# Output the bucket names so they can be used in the workflow
output "state_bucket_name" {
  value = aws_s3_bucket.state_bucket.bucket
}

output "lock_bucket_name" {
  value = aws_s3_bucket.lock_bucket.bucket
}

# # bootstrap.tf
variable "aws_region" {
  description = "The AWS region"
  type        = string
  # default     = "us-west-2"  # You can default to a region
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
  default     = "dev"  # Default to dev if not passed
}

# Check if the state bucket exists
data "aws_s3_bucket" "state_bucket_check" {
  bucket = "dw-test-state-dev"
}

# Check if the lock bucket exists
data "aws_s3_bucket" "lock_bucket_check" {
  bucket = "dw-test-lock-dev"
}