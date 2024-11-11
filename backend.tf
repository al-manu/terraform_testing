terraform {
  backend "s3" {
    bucket = "dev-state-bucket1"  # Replace with actual bucket name or use a variable
    key    = "terraform/dev/dev.tfstate"  # Path to the state file inside the bucket
    # region = "us-west-2"                   # Region for the S3 bucket
    encrypt = true                         # Enable encryption for state files
    acl     = "bucket-owner-full-control"   # Optional ACL setting for full control
  }
}
