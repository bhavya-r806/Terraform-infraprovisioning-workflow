resource "aws_vpc" "network" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    {
      Name        = var.vpc_name
      Environment = var.Environment
    }
  )
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnets" {
  for_each = local.all_subnets

  vpc_id     = aws_vpc.network.id
  cidr_block = each.value

  availability_zone = element(
    data.aws_availability_zones.available.names,
    index(sort(keys(local.all_subnets)), each.key)
      % length(data.aws_availability_zones.available.names)
  )

  tags = merge(
    var.tags,
    {
      Name        = each.key
      Tier        = contains(keys(local.public_subnets), each.key) ? "public" : "private"
      Environment = var.Environment
    }
  )
}
