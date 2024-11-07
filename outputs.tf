output "in_bucket_arn" {
  value = aws_s3_bucket.in_bucket.arn  # ARN of the input bucket
}

output "out_bucket_arn" {
  value = aws_s3_bucket.out_bucket.arn  # ARN of the output bucket.
}

output "tmp_bucket_arn" {
  value = aws_s3_bucket.tmp_bucket.arn  # ARN of the temporary bucket.
}

output "export_bucket_arn" {
  value = aws_s3_bucket.export_bucket.arn  # ARN of the export bucket.
}


# outputs.tf: Output the backend resource configurations for review

output "tf_state_bucket" {
  description = "The S3 bucket where Terraform state is stored"
  value       = var.tf_state_bucket
}

output "tf_state_lock_table" {
  description = "The S3-based lock table used for Terraform state locking"
  value       = var.tf_state_lock_table
}