resource "azurerm_network_interface" "nic" {
  name                = "k3s-dev-nic"
  resource_group_name = azurerm_resource_group.dev-resource_group.name
  location            = azurerm_resource_group.dev-resource_group.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.k3s-default.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.k3s_pip.id

  }
}