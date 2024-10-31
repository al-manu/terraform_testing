output "lambda_function_name" {
  description = "The name of the created Lambda function"
  value       = aws_lambda_function.my_lambda.function_name
}

output "lambda_function_arn" {
  description = "The ARN of the created Lambda function"
  value       = aws_lambda_function.my_lambda.arn
}

output "lambda_role_arn" {
  description = "The ARN of the IAM role used by the Lambda function"
  value       = data.aws_iam_role.existing_role.arn
}
