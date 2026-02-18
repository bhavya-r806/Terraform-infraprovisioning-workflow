environment = "dev"

resource_group_name = "dev-resource-rg"
location            = "East US"

vnet_name  = "dev-vnet"
vnet_cidr  = "10.10.0.0/23"

public_subnet_count  = 1
private_subnet_count = 1

subnet_newbits = 2   # /23 → /25

tags = {
  Environment = "dev"
  ManagedBy  = "Terraform"
}
