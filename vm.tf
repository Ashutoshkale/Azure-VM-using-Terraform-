resource "azurerm_linux_virtual_machine" "k3s-dev" {
  name                  = "vm-rcs-k3s-dev"
  location              = azurerm_resource_group.dev-resource_group.location
  resource_group_name   = azurerm_resource_group.dev-resource_group.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = "Standard_B4ms"

  os_disk {
    name                 = "k3s-dev-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  computer_name                   = "my-vm"
  admin_username                  = "ubuntu"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "ubuntu"
    public_key = file("./ssh-keys/my-key.pub")
  }


  tags = {
    environment = "dev"
  }
}