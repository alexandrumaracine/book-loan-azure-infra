resource "azurerm_container_app" "this" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = var.environment_id
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  registry {
    server   = var.acr_login_server
    identity = var.identity_id
  }

  template {
    container {
      name   = "app"
      image  = var.image
      cpu    = var.cpu
      memory = var.memory

      dynamic "env" {
        for_each = var.env
        content {
          name  = env.key
          value = env.value
        }
      }
    }
  }

  dynamic "ingress" {
    for_each = var.ingress == null ? [] : [var.ingress]
    content {
      external_enabled           = try(ingress.value.external_enabled, true)
      target_port                = ingress.value.target_port
      transport                  = try(ingress.value.transport, "auto")
      allow_insecure_connections = try(ingress.value.allow_insecure_connections, true)

      traffic_weight {
        latest_revision = true
        percentage      = 100
      }
    }
  }
}
