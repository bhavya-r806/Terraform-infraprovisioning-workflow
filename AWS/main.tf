module "vpc" {
  source = "./modules/vpc"
  subnet_newbits = var.subnet_newbits
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  region  = var.region

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  tags = var.tags
}
