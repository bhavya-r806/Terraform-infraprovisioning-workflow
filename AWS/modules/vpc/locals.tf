locals {
  public_subnets = {
    for i in range(var.public_subnet_count) :
    "public-${i + 1}" => cidrsubnet(var.vpc_cidr, var.subnet_newbits, i)
  }

  private_subnets = {
    for i in range(var.private_subnet_count) :
    "private-${i + 1}" => cidrsubnet(
      var.vpc_cidr,
      var.subnet_newbits,
      i + var.public_subnet_count
    )
  }

  all_subnets = merge(
    local.public_subnets,
    local.private_subnets
  )
}