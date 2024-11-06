# variables.tf (in the bootstrap directory)

variable "environment" {
  description = "The environment name"
  type        = string
  default     = "dev"
}
