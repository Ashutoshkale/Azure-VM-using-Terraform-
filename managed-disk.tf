resource "azurerm_managed_disk" "k3s-data" {
  name                 = "data"
  location             = azurerm_resource_group.dev-resource_group.location
  create_option        = "Empty"
  disk_size_gb         = 300
  resource_group_name  = azurerm_resource_group.dev-resource_group.name
  storage_account_type = "Standard_LRS"
}

resource "azurerm_virtual_machine_data_disk_attachment" "data" {
  virtual_machine_id = azurerm_linux_virtual_machine.k3s-dev.id
  managed_disk_id    = azurerm_managed_disk.k3s-data.id
  lun                = 0
  caching            = "None"
}