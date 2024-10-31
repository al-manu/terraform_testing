provider "aws" {
  region = var.aws_region  # Use the specified AWS region from variables
}

# Create an IAM role for the Lambda function
resource "aws_iam_role" "lambda_role" {
  name               = "lambda_execution_role"  # Name of the IAM role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"  # Allows Lambda to assume this role
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

# Attach the basic execution policy to the role
resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name       = "lambda_policy_attachment"  # Name of the policy attachment
  roles      = [aws_iam_role.lambda_role.name]  # Attach to the created IAM role
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"  # Policy for basic execution and logging
}

# Define the Lambda function
resource "aws_lambda_function" "my_lambda" {
  function_name = "myBasicLambda"  # Name of the Lambda function
  role          = aws_iam_role.lambda_role.arn  # ARN of the IAM role
  handler       = "lambda_function.lambda_handler"  # The handler function to execute (filename.function_name)
  runtime       = "python3.8"  # Runtime environment for the Lambda function
  timeout       = 3  # Timeout in seconds (within free tier limits)
  
  # Specify the code for the Lambda function
  filename         = "lambda_function.zip"  # Path to the zip file containing the Lambda code
  source_code_hash = filebase64sha256("lambda_function.zip")  # Hash of the zip file for change detection
  

}

# Output the ARN of the Lambda function after deployment
output "lambda_function_arn" {
  value = aws_lambda_function.my_lambda.arn  # Outputs the ARN of the created Lambda function
}
