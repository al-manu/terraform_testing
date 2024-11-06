# fstate directory needed here please
# terraform {
#   backend "s3" {
#     bucket         = "aa-terraform-state-bucket"      # The name of your S3 bucket for state file
#     key            = "terraform/dev.tfstate"          # The key (path) to store the state file
#     encrypt        = true                              # Enable state file encryption in S3
#     dynamodb_table = "my-terraform-lock-table"         # Name of the DynamoDB table used for state locking
#     acl            = "bucket-owner-full-control"       # Set S3 ACL
#   }
# }


# Backend configuration for each environment
terraform {
  backend "s3" {
    bucket         = "aa-terraform-state-bucket"
    key            = "terraform/${var.environment}/state.tfstate"  # Environment-specific path
    # region         = "us-east-1"
    dynamodb_table = "terraform-lock-${var.environment}"  # Environment-specific DynamoDB table
  }
}
