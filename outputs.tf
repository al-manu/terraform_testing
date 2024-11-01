output "lambda_function_name" {
  description = "The name of the created Lambda function"
  value       = aws_lambda_function.my_lambda.function_name
}

output "lambda_function_arn" {
  description = "The ARN of the created Lambda function"
  value       = aws_lambda_function.my_lambda.arn
}

output "lambda_role_arn" {
  description = "The ARN of the IAM role created for the Lambda function"
  value       = aws_iam_role.lambda_role.arn
}


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
