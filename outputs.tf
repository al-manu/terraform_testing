output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.main.id
}

output "redshift_secret_arn" {
  description = "The ARN of the Redshift secret"
  value       = aws_secretsmanager_secret.redshift_secret.arn
}
