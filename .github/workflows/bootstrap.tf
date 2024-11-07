# bootstrap.tf

# Variable for environment
variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
  default     = "dev"  # Default to dev if not passed
}

# Variable for AWS Region
variable "aws_region" {
  description = "The AWS region"
  type        = string
  # default     = "us-west-2"  # Default to a region if not passed
}

# Check if the state bucket exists
data "aws_s3_bucket" "state_bucket_check" {
  bucket = "dw-test-state-${var.environment}"
  # This data source will fail if the bucket does not exist, which is expected behavior
}

# Check if the lock bucket exists
data "aws_s3_bucket" "lock_bucket_check" {
  bucket = "dw-test-lock-${var.environment}"
  # This data source will fail if the bucket does not exist, which is expected behavior
}

# Create state bucket only if it doesn't exist
resource "aws_s3_bucket" "state_bucket" {
  count  = length(data.aws_s3_bucket.state_bucket_check.id) == 0 ? 1 : 0
  bucket = "dw-test-state-${var.environment}"
  acl    = "private"
}

# Create lock bucket only if it doesn't exist
resource "aws_s3_bucket" "lock_bucket" {
  count  = length(data.aws_s3_bucket.lock_bucket_check.id) == 0 ? 1 : 0
  bucket = "dw-test-lock-${var.environment}"
  acl    = "private"
}

# Output the state bucket name
output "state_bucket_name" {
  value = aws_s3_bucket.state_bucket[0].bucket
  description = "The name of the state bucket"
}

# Output the lock bucket name
output "lock_bucket_name" {
  value = aws_s3_bucket.lock_bucket[0].bucket
  description = "The name of the lock bucket"
}
