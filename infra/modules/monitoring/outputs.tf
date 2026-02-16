output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.law.id
}

output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.law.name
}

output "application_insights_id" {
  value = azurerm_application_insights.appi.id
}

output "application_insights_name" {
  value = azurerm_application_insights.appi.name
}

output "application_insights_connection_string" {
  value     = azurerm_application_insights.appi.connection_string
  sensitive = true
}
