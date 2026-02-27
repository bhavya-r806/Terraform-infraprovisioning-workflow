module "vpc" {
  source = "./modules/vpc"

  region          = var.region
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  subnet_newbits  = var.subnet_newbits

  public_subnet_count  = var.public_subnet_count 
  private_subnet_count = var.private_subnet_count

  Environment = var.Environment
  tags        = var.tags
}

