resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku           = "Standard"
  admin_enabled = false

  # Keep minimal defaults (no private endpoints / no network rules yet)
}
