
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

# # s3_backend.tf
# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "your-terraform-state-bucket"
#   # region = "us-west-2"

#   versioning {
#     enabled = true
#   }

#   lifecycle {
#     prevent_destroy = true  # Prevent accidental deletion of the state bucket
#   }
# }

variable "environment" {}

resource "aws_s3_bucket" "state" {
  bucket = "my-terraform-state-${var.environment}"
  acl    = "private"
}

resource "aws_s3_bucket" "lock" {
  bucket = "my-terraform-lock-${var.environment}"
  acl    = "private"
}

