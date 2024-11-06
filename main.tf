# --------------------------------------------------------------------------------------
# Create S3 buckets 
# --------------------------------------------------------------------------------------

# Create the input S3 bucket
resource "aws_s3_bucket" "in_bucket" {
  bucket = var.in_bucket_name  # Name of the input bucket.
}

# Create the output S3 bucket
resource "aws_s3_bucket" "out_bucket" {
  bucket = var.out_bucket_name  # Name of the output bucket
}

# Create the temporary S3 bucket
resource "aws_s3_bucket" "tmp_bucket" {
  bucket = var.tmp_bucket_name  # Name of the temporary bucket
}

# Create the export S3 bucket
resource "aws_s3_bucket" "export_bucket" {
  bucket = var.export_bucket_name  # Name of the export bucket
}

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
}