environment = "prod"

resource_group_name = "prod-resource-rg"
location            = "East US"

vnet_name  = "prod-vnet"
vnet_cidr  = "10.0.0.0/23"

public_subnet_count  = 1
private_subnet_count = 1

subnet_newbits = 2   # /23 → /25 (128 IPs per subnet)

tags = {
  Environment = "prod"
  ManagedBy  = "Terraform"
}
