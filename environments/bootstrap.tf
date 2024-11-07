# # bootstrap.tf

# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "terraform-state"  # The bucket for storing the state file
# #   acl    = "private"
# }

# resource "aws_dynamodb_table" "terraform_lock" {
#   name         = "terraform-lock-${var.environment}"  # Name based on the environment
#   hash_key     = "LockID"
#   billing_mode = "PAY_PER_REQUEST"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     Environment = var.environment
#   }
# }


# # variable "environment" {
# #   description = "The environment name"
# #   type        = string
# #   default     = "dev"
# # }

# # # variables.tf (in the bootstrap directory)

# # # outputs.tf (in the bootstrap directory)

# # output "s3_bucket_name" {
# #   value = aws_s3_bucket.terraform_state.bucket
# # }

# # output "dynamodb_table_name" {
# #   value = aws_dynamodb_table.terraform_lock.name
# # }


# Create an S3 bucket for storing the Terraform state
resource "aws_s3_bucket" "state_bucket" {
  bucket = var.tf_state_bucket
  acl    = "private"  # ACL for secure access

  versioning {
    enabled = true  # Enable versioning for state locking
  }

  tags = {
    Name        = "Terraform State"
    Environment = var.environment  # Environment-specific tag (dev, prod, etc.)
  }
}

# Enable bucket versioning for handling concurrent writes (locking)
resource "aws_s3_bucket_object_lock_configuration" "lock_configuration" {
  bucket = aws_s3_bucket.state_bucket.bucket

  lock_configuration {
    lock_enabled = "Enabled"
    rule {
      default_retention {
        days = 365  # Optional: Retention policy, could be indefinite
        mode = "COMPLIANCE"
      }
    }
  }
}
