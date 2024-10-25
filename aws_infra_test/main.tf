provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_name = var.vpc_name
  cidr_block = var.cidr_block
}
