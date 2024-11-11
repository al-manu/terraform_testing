# terraform {
#   backend "s3" {
#     bucket = "dev-state-bucket1"  # Replace with actual bucket name or use a variable
#     key    = "terraform/dev/dev.tfstate"  # Path to the state file inside the bucket
#     # region = "us-west-2"                   # Region for the S3 bucket
#     encrypt = true                         # Enable encryption for state files
#     acl     = "bucket-owner-full-control"   # Optional ACL setting for full control
#   }
# }


terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-unique-12345"  # Your S3 bucket name from bootstrap
    key            = "terraform/dev/dev.tfstate"  # Path to the state file
    # region         = "us-east-1"  # Your AWS region
    encrypt        = true  # Enable server-side encryption for state files
    versioning     = true  # Enable versioning for state locking
    lock            = true  # Enable state locking using S3
  }
}
