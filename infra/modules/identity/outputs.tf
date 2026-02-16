output "id" {
  value       = azurerm_user_assigned_identity.this.id
  description = "UAMI resource ID."
}

output "principal_id" {
  value       = azurerm_user_assigned_identity.this.principal_id
  description = "UAMI principal ID."
}

output "client_id" {
  value       = azurerm_user_assigned_identity.this.client_id
  description = "UAMI client ID."
}
