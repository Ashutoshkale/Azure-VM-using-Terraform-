resource "azurerm_public_ip" "my-vm-pip" {
  name                = "my-vm-pip"
  resource_group_name = azurerm_resource_group.dev-resource_group.name
  location            = azurerm_resource_group.dev-resource_group.location
  allocation_method   = "Dynamic"
}