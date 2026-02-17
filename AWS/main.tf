module "vpc" {
  source = "./modules/vpc"

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_count   = var.public_subnet_count
  private_subnet_count  = var.private_subnet_count
  subnet_newbits        = var.subnet_newbits
  tags                  = var.tags
}
