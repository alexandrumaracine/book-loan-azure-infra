output "id" {
  value       = azurerm_container_app_environment.this.id
  description = "ACA Environment resource ID."
}

output "name" {
  value       = azurerm_container_app_environment.this.name
  description = "ACA Environment name."
}

output "default_domain" {
  value       = azurerm_container_app_environment.this.default_domain
  description = "Default domain for the ACA environment."
}
