# Create a resource group
resource "azurerm_resource_group" "dev-resource_group" {

  name     = "RG-ARTUS-CONNECT-DEV-TF"
  location = var.rcs-region

  tags = {

    "Enviroments" = "dev"

  }
}

