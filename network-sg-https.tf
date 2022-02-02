resource "azurerm_network_security_group" "nsg-https" {
  name                = "nsghttps"
  location            = azurerm_resource_group.dev-resource_group.location
  resource_group_name = azurerm_resource_group.dev-resource_group.name

}


resource "azurerm_network_security_rule" "ssh-rule" {
  name                        = "SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.dev-resource_group.name
  network_security_group_name = azurerm_network_security_group.nsg-https.name
}

resource "azurerm_network_security_rule" "https-rule" {
  name                        = "HTTPS"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.dev-resource_group.name
  network_security_group_name = azurerm_network_security_group.nsg-https.name
}

