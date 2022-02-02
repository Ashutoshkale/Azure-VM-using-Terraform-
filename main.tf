terraform {

  backend "azurerm" {

    resource_group_name  = "RG-ARTUS-CONNECT-RCS-SHARED"
    storage_account_name = "sarcsterraformbackend"
    container_name       = "terrafrom-statefiles-dev"
    key                  = "terraform.tfstate"

  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "=3.1.0"
    }

  }
}

provider "azurerm" {
  features {}
}

provider "random" {
  features {}

}

