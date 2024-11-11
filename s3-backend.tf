resource "aws_s3_bucket" "state_bucket" {
  bucket = "${var.environment}-state-bucket"
  acl    = "private"

  tags = {
    Name        = "State Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "lock_bucket" {
  bucket = "${var.environment}-lock-bucket"
  acl    = "private"

  tags = {
    Name        = "Lock Bucket"
    Environment = var.environment
  }
}

output "state_bucket_name" {
  value = aws_s3_bucket.state_bucket.bucket
}

output "lock_bucket_name" {
  value = aws_s3_bucket.lock_bucket.bucket
}
