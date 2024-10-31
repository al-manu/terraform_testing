variable "aws_region" {
  description = "The AWS region to deploy resources"  # Description of the variable
  type        = string  # The type of variable
}
variable "aws_role_arn" {
  description = "The ARN of the role to assume"
  type        = string
}