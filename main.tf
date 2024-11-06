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
  name         = "my-terraform-lock-table"   # Use your own name for the table
  hash_key     = "LockID"                    # Required for Terraform state locking
  billing_mode = "PAY_PER_REQUEST"           # You can use "PROVISIONED" if you prefer

  attribute {
    name = "LockID"
    type = "S"  # LockID must be a string
  }

  tags = {
    "Environment" = "dev"
    "Project"     = "terraform"
  }
}