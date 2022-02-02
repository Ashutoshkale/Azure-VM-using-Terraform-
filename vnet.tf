resource "azurerm_virtual_network" "rcs-dev-vnet" {
  name                = "vnet-rcs-dev-aks"
  location            = azurerm_resource_group.dev-resource_group.location
  resource_group_name = azurerm_resource_group.dev-resource_group.name
  address_space       = ["10.0.0.0/24"]
}

# Create a Subnet for AKS
resource "azurerm_subnet" "k3s-default" {
  name                 = "k3s-default-subnet"
  virtual_network_name = azurerm_virtual_network.rcs-dev-vnet.name
  resource_group_name  = azurerm_resource_group.dev-resource_group.name
  address_prefixes     = ["10.0.0.0/26"]
}

