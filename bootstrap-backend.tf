# provider "aws" {
#   region = "us-east-1"  # Choose your AWS region
# }

# Create the S3 Bucket for storing Terraform state
resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "my-terraform-state-bucket-unique-12345"  # Replace with your unique bucket name
  acl    = "private"

  # Enable versioning for lock handling
  versioning {
    enabled = true
  }

  tags = {
    Name = "Terraform State Bucket"
  }
}

# Output the name of the created S3 bucket
output "state_bucket_name" {
  value = aws_s3_bucket.tf_state_bucket.bucket
}
