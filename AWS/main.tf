module "vpc" {
  source = "./modules/vpc"

  region          = var.region
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  subnet_newbits  = var.subnet_newbits

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  Environment = var.Environment
  tags        = var.tags
}

