
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_cidr]

  tags = var.tags
}


resource "azurerm_subnet" "testsubnet" {
  for_each = local.all_subnets

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}

# creating NSG per subnet type

resource "azurerm_network_security_group" "public" {
  name                = "${var.vnet_name}-public-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  
}

resource "azurerm_network_security_group" "private" {
  name                = "${var.vnet_name}-private-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags


}

# attaching correct NSG to each subnet


resource "azurerm_subnet_network_security_group_association" "subnetNSG" {
  for_each = azurerm_subnet.testsubnet

  subnet_id = each.value.id

  network_security_group_id = (
    startswith(each.key, "public")
    ? azurerm_network_security_group.public.id
    : azurerm_network_security_group.private.id
  )
}
#adding publicIP to NAT Gateway

resource "azurerm_public_ip" "natpublicIp" {
  name                = "${var.vnet_name}-nat-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

# Adding NAT Gateway

resource "azurerm_nat_gateway" "TestNat" {
  name                = "${var.vnet_name}-nat-gateway"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "Standard"

  tags = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "natassociation" {
  nat_gateway_id       = azurerm_nat_gateway.TestNat.id
  public_ip_address_id = azurerm_public_ip.natpublicIp.id
}


#subnet association

resource "azurerm_subnet_nat_gateway_association" "private" {
  for_each = {
    for k, s in azurerm_subnet.testsubnet :
    k => s if startswith(k, "private")
  }

  subnet_id      = each.value.id
  nat_gateway_id = azurerm_nat_gateway.TestNat.id
}



