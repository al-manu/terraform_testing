variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "db_secret_name" {
  description = "The name of the secret for Redshift"
  type        = string
  default     = "redshift_secret"
}

variable "redshift_admin_password" {
  description = "Admin password for Redshift"
  type        = string
  sensitive   = true
}
