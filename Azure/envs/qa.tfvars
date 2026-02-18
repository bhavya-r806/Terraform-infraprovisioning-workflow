environment = "qa"

resource_group_name = "qa-resource-rg"
location            = "East US"

vnet_name  = "qa-vnet"
vnet_cidr  = "10.20.0.0/23"

public_subnet_count  = 1
private_subnet_count = 1

subnet_newbits = 2   # /23 → /25

tags = {
  Environment = "qa"
  ManagedBy  = "Terraform"
}
