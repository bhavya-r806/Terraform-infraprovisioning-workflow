module "vpc" {
  source = "./modules/vpc"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  region  = var.region

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  tags = var.tags
}
