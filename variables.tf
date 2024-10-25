# variable "aws_region" {
#   description = "AWS region"
#   type        = string
#   default     = "eu-central-1"
# }

# variable "vpc_name" {
#   description = "Name of the VPC"
#   type        = string
# }

# variable "cidr_block" {
#   description = "CIDR block for the VPC"
#   type        = string
#   default     = "10.0.0.0/16"
# }


variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

