# Create VPC
resource "aws_vpc" "network" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, { Name = var.vpc_name })
}

# Get available AZs
data "aws_availability_zones" "available" {
  state = "available"
}

# Create subnets
resource "aws_subnet" "subnets" {
  for_each = toset(range(local.total_subnets)) # iterate over subnet indexes

  vpc_id     = aws_vpc.network.id
  cidr_block = local.all_subnets[each.value]

  # Stable AZ assignment
  availability_zone = element(
    data.aws_availability_zones.available.names,
    each.value % length(data.aws_availability_zones.available.names)
  )

  tags = merge(
    var.tags,
    {
      Name = "subnet-${each.value + 1}"
      Tier = each.value < var.public_subnets ? "public" : "private"
    }
  )
}
