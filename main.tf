
# Create S3 buckets dynamically based on environment
resource "aws_s3_bucket" "in_bucket" {
  bucket = "in-bucket-${var.environment}-061124"  # Unique bucket name for each environment
}

resource "aws_s3_bucket" "out_bucket" {
  bucket = "out-bucket-${var.environment}-061124"
}

resource "aws_s3_bucket" "tmp_bucket" {
  bucket = "tmp-bucket-${var.environment}-061124"
}

resource "aws_s3_bucket" "export_bucket" {
  bucket = "export-bucket-${var.environment}-061124"
}
# resource "random_string" "unique_suffix" {
#   length  = 8
#   special = false
#   upper   = false
# }
# # Create the S3 buckets dynamically based on environment
# resource "aws_s3_bucket" "state_bucket" {
#   bucket = "${var.TF_STATE_BUCKET}-${var.environment}"
# }

# Create DynamoDB lock table for each environment
resource "aws_dynamodb_table" "terraform_lock_table" {
  count         = var.environment == "" ? 0 : 1
  name          = "terraform-lock-${var.environment}"  # Unique table name for each environment
  hash_key      = "LockID"
  billing_mode  = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = var.environment
    Project     = "terraform"
  }

    lifecycle {
    create_before_destroy = true  # Ensures table is created before anything else
  }
}


# Create the S3 bucket for storing Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state"  # Specify your desired bucket name
  # acl    = "private"          # Set ACL to private (or another based on your security model)

  tags = {
    Name        = "Terraform State Bucket"
    Environment = var.environment
  }
}
