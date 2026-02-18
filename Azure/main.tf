
# Create Resource Group
resource "azurerm_resource_group" "resourcegroup" {
  name     = var.resource_group_name
  location = var.location

}

# VNet Module
module "vnet" {
  source = "./modules/vnet"

  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.resourcegroup.name

  vnet_cidr            = var.vnet_cidr
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
  subnet_newbits       = var.subnet_newbits

  tags = {
    environment = "testing"
  }
}