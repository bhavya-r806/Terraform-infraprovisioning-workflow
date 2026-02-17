resource "aws_vpc" "network" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    { Name = var.vpc_name }
  )
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "subnets" {
  for_each = local.all_subnets

  vpc_id     = aws_vpc.this.id
  cidr_block = each.value

  availability_zone = data.aws_availability_zones.available.names[
    index(keys(local.all_subnets), each.key)
    % length(data.aws_availability_zones.available.names)
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}-${each.key}"
      Tier = startswith(each.key, "public") ? "public" : "private"
    }
  )
}

