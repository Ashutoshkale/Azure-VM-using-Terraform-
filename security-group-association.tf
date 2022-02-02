# resource "azurerm_network_interface_security_group_association" "ssh-association" {
#   network_interface_id      = azurerm_network_interface.nic.id
#   network_security_group_id = azurerm_network_security_group.nsg.id


# }

resource "azurerm_network_interface_security_group_association" "https-association" {

  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg-https.id

}