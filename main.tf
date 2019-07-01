provider "azurerm" {
    version = "~> 1.31.0"
}

resource "azurerm_resource_group" "test" {
  name     = "api-rg-isolated"
  location = "East US"
}

resource "azurerm_app_service_plan" "test" {
  name                = "api-appserviceplan-iso"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Isolated"
    size = "I1"
    capacity = 1
  }
}
