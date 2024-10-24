# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# Create a subnet
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr
  availability_zone = "eu-central-1a"
}

# Create a Security Group
resource "aws_security_group" "redshift_sg" {
  vpc_id = aws_vpc.main.id
}

# Create a Secrets Manager Secret
resource "aws_secretsmanager_secret" "redshift_secret" {
  name = var.db_secret_name
}

# Create IAM Role for Redshift
resource "aws_iam_role" "redshift_role" {
  name = "redshift-serverless-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = {
        Service = "redshift-serverless.amazonaws.com"
      }
      Effect    = "Allow"
      Sid       = ""
    }]
  })
}

# Attach IAM Policy to the Role
resource "aws_iam_policy" "redshift_policy" {
  name        = "redshift-serverless-policy"
  description = "Policy for Redshift Serverless to access S3 and Glue"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:GetObject", "s3:ListBucket"]
        Resource = ["arn:aws:s3:::redtest/*", "arn:aws:s3:::redtest"]
        Effect   = "Allow"
      },
      {
        Action   = ["glue:GetTable", "glue:GetTables"]
        Resource = "*"
        Effect   = "Allow"
      },
      {
        Action   = ["secretsmanager:GetSecretValue"]
        Resource = aws_secretsmanager_secret.redshift_secret.arn
        Effect   = "Allow"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "redshift_policy_attach" {
  policy_arn = aws_iam_policy.redshift_policy.arn
  role       = aws_iam_role.redshift_role.name
}

# Optional: Security Group Ingress Rule
resource "aws_security_group_rule" "allow_postgres" {
  type        = "ingress"
  from_port   = 5439  # Default port for Redshift
  to_port     = 5439
  protocol    = "tcp"
  security_group_id = aws_security_group.redshift_sg.id
  cidr_blocks  = ["147.161.180.116/32"]  # Replace with your public IP
}


resource "aws_s3_bucket" "data_bucket" {
  bucket = "redtest"  # Change this to a globally unique name
}