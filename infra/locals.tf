locals {
  resource_group_name = "${var.project_name}-${var.environment}-rg"

  # Example: keep short + unique. ACR requires lowercase alphanumeric only.
  # If you already have a naming scheme, use that.
  acr_name = "bl${random_string.suffix.result}acr"

  aca_env_name = "bl-${random_string.suffix.result}-aca-env"

  uami_name         = "bl-${random_string.suffix.result}-uami"
  aca_service_name  = "bl-${random_string.suffix.result}-svc"
  aca_consumer_name = "bl-${random_string.suffix.result}-consumer"


  tags = {
    project     = var.project_name
    environment = var.environment
    managedBy   = "terraform"
  }
}
