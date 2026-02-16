locals {
  resource_group_name = "${var.project_name}-${var.environment}-rg"

  # Example: keep short + unique. ACR requires lowercase alphanumeric only.
  # If you already have a naming scheme, use that.
  acr_name = "bl${random_string.suffix.result}acr"

  tags = {
    project     = var.project_name
    environment = var.environment
    managedBy   = "terraform"
  }
}
