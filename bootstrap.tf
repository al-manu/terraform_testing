# bootstrap.tf
# provider "aws" {
#   region = var.aws_region
# }

resource "aws_s3_bucket" "state_bucket" {
  bucket = "dw-test-state-${var.environment}"
  acl    = "private"
}

resource "aws_s3_bucket" "lock_bucket" {
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
