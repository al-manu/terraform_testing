# provider "aws" {
#   region = var.aws_region
# }

# module "vpc" {
#   source = "./modules/vpc"
#   vpc_name = var.vpc_name
#   cidr_block = var.cidr_block
# }


provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}
