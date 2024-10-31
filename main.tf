provider "aws" {
  region = var.aws_region  # Set AWS region from variable
}

# Data source to get the IAM role by ARN
data "aws_iam_role" "existing_role" {
  arn = var.aws_role_arn  # Fetch the role by ARN
}

# Attach the basic execution policy to the existing role
resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name       = "lambda_policy_attachment"
  roles      = [data.aws_iam_role.existing_role.name]  # Attach to the existing IAM role
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Define the Lambda function using the existing role
resource "aws_lambda_function" "my_lambda" {
  function_name = "myBasicLambda"
  role          = data.aws_iam_role.existing_role.arn  # Use the existing IAM role ARN
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 3
  
  # Specify the code for the Lambda function
  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
}
