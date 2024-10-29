output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "vpc_dns_support" {
  description = "DNS support enabled"
  value       = aws_vpc.main.enable_dns_support
}

output "vpc_dns_hostnames" {
  description = "DNS hostnames enabled"
  value       = aws_vpc.main.enable_dns_hostnames
}
