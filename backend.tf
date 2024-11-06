# fstate directory needed here please
terraform {
  backend "s3" {
    bucket = "aa-terraform-state-bucket"
    key    = "terraform/state.tfstate"
    dynamodb_table = "my-terraform-lock-table"  # Ensure state locking is enabled
    encrypt = true
  }
}
