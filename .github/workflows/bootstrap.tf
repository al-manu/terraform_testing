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
}

# Check if the lock bucket exists
data "aws_s3_bucket" "lock_bucket_check" {
  bucket = "dw-test-lock-${var.environment}"
}

# # Create the state bucket if it doesn't exist
# resource "aws_s3_bucket" "state_bucket" {
#   bucket = "dw-test-state-${var.environment}"
#   acl    = "private"
#   # Only create if it doesn't already exist
#   lifecycle {
#     prevent_destroy = true  # Prevent accidental deletion
#   }

#   # Only create if the bucket doesn't exist already
#   count = length(data.aws_s3_bucket.state_bucket_check.id) == 0 ? 1 : 0
# }

# # Create the lock bucket if it doesn't exist
# resource "aws_s3_bucket" "lock_bucket" {
#   bucket = "dw-test-lock-${var.environment}"
#   # Enable versioning for state file recovery
#   versioning {
#     enabled = true
#   }
#   # Only create if it doesn't already exist
#   lifecycle {
#     prevent_destroy = true  # Prevent accidental deletion
#   }

#   # Only create if the bucket doesn't exist already
#   count = length(data.aws_s3_bucket.lock_bucket_check.id) == 0 ? 1 : 0
# }

# # Output the state bucket name
# output "state_bucket_name" {
#   value = length(aws_s3_bucket.state_bucket) > 0 ? aws_s3_bucket.state_bucket[0].bucket : data.aws_s3_bucket.state_bucket_check.bucket
#   description = "The name of the state bucket"
# }

# # Output the lock bucket name
# output "lock_bucket_name" {
#   value = length(aws_s3_bucket.lock_bucket) > 0 ? aws_s3_bucket.lock_bucket[0].bucket : data.aws_s3_bucket.lock_bucket_check.bucket
#   description = "The name of the lock bucket"
# }



# Create S3 Bucket for state
resource "aws_s3_bucket" "state_bucket" {
  bucket = "dw-test-state-${var.environment}"  # This will create a bucket per environment (dev, sit, prod)
  acl    = "private"
  region = var.aws_region
}

# Create S3 Bucket for lock
resource "aws_s3_bucket" "lock_bucket" {
  bucket = "dw-test-lock-${var.environment}"  # This will create a lock bucket per environment
  acl    = "private"
  region = var.aws_region
}

# Optionally, add logging, versioning, or encryption for better security and management
resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Optionally, define the lock bucket's versioning
resource "aws_s3_bucket_versioning" "lock_bucket_versioning" {
  bucket = aws_s3_bucket.lock_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Define outputs to get the bucket names
output "state_bucket_name" {
  value = aws_s3_bucket.state_bucket.bucket
}

output "lock_bucket_name" {
  value = aws_s3_bucket.lock_bucket.bucket
}
