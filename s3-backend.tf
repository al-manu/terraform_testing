# resource "aws_s3_bucket" "state_bucket" {
#   bucket = "${var.environment}-state-bucket1"
#   acl    = "private"
#  lifecycle {
#     prevent_destroy = true  # Prevents accidental deletion of the bucket
#   }
#   tags = {
#     Name        = "State Bucket"
#     Environment = var.environment
#   }
  
# }

# resource "aws_s3_bucket" "lock_bucket" {
#   bucket = "${var.environment}-lock-bucket1"
#   acl    = "private"
#    lifecycle {
#     prevent_destroy = true  # Prevents accidental deletion of the bucket
#   }

#   tags = {
#     Name        = "Lock Bucket"
#     Environment = var.environment
#   }
# }

# output "state_bucket_name" {
#   value = aws_s3_bucket.state_bucket.bucket
# }

# output "lock_bucket_name" {
#   value = aws_s3_bucket.lock_bucket.bucket
# }


# data "aws_s3_bucket" "existing_state" {
#   bucket = "my-unique-state-bucket"
# }

# data "aws_s3_bucket" "existing_lock" {
#   bucket = "my-unique-lock-bucket"
# }



# resource "aws_s3_bucket" "state_bucket" {
#   bucket = "${var.environment}-state-bucket1"
#   count  = length(data.aws_s3_bucket.existing_state.id) == 0 ? 1 : 0  # Create only if it doesn't exist
#   acl    = "private"

#   lifecycle {
#     prevent_destroy = true  # Prevents accidental deletion of the bucket
#   }

#   tags = {
#     Name        = "State Bucket"
#     Environment = var.environment
#   }

#   # Using the data block to check if the bucket already exists

# }
  data "aws_s3_bucket" "existing_state" {
    bucket = "${var.environment}-state-bucket1"
  }

# resource "aws_s3_bucket" "lock_bucket" {
#   bucket = "${var.environment}-lock-bucket1"
#   count  = length(data.aws_s3_bucket.existing_lock.id) == 0 ? 1 : 0  # Create only if it doesn't exist
#   acl    = "private"

#   lifecycle {
#     prevent_destroy = true  # Prevents accidental deletion of the bucket
#   }

#   tags = {
#     Name        = "Lock Bucket"
#     Environment = var.environment
#   }

#   # Using the data block to check if the bucket already exists

# }

  data "aws_s3_bucket" "existing_lock" {
    bucket = "${var.environment}-lock-bucket1"
  }





resource "aws_s3_bucket" "state_bucket" {
  count = length(data.aws_s3_bucket.existing_state.id) == 0 ? 1 : 0
  bucket = "${var.environment}-state-bucket1"
   versioning {
    enabled = true  # Directly enable versioning
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "State Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "lock_bucket" {
  count = length(data.aws_s3_bucket.existing_lock.id) == 0 ? 1 : 0
  bucket = "${var.environment}-lock-bucket1"
  versioning {
    enabled = true  # Directly enable versioning
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "Lock Bucket"
    Environment = var.environment
  }
}
