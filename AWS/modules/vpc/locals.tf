locals {
  public_subnets = {
    for i in range(var.public_subnet) :
    "public-${i + 1}" => cidrsubnet(var.vpc_cidr, var.subnet_newbits, i)
  }

  private_subnets = {
    for i in range(var.private_subnet) :
    "private-${i + 1}" => cidrsubnet(
      var.vpc_cidr,
      var.subnet_newbits,
      i + var.public_subnet
    )
  }

  all_subnets = merge(local.public_subnets, local.private_subnets)
}
