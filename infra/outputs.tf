output "resource_group_name" {
  value = module.rg.name
}

output "resource_group_location" {
  value = module.rg.location
}

output "resource_group_id" {
  value = module.rg.id
}

output "log_analytics_workspace_name" {
  value = module.monitoring.log_analytics_workspace_name
}

output "application_insights_name" {
  value = module.monitoring.application_insights_name
}

output "application_insights_connection_string" {
  value     = module.monitoring.application_insights_connection_string
  sensitive = true
}

output "acr_id" {
  value       = module.acr.id
  description = "ACR resource ID."
}

output "acr_name" {
  value       = module.acr.name
  description = "ACR name."
}

output "acr_login_server" {
  value       = module.acr.login_server
  description = "ACR login server."
}

output "aca_env_id" {
  value       = module.aca_env.id
  description = "ACA Environment resource ID."
}

output "aca_env_name" {
  value       = module.aca_env.name
  description = "ACA Environment name."
}

output "aca_env_default_domain" {
  value       = module.aca_env.default_domain
  description = "ACA Environment default domain."
}
