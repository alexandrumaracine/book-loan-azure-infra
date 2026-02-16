locals {
  resource_group_name = "${var.project_name}-${var.environment}-rg"

  # IMPORTANT:
  # This must match the already deployed resources in Azure.
  # Current deployed suffix is: 9m2mo5
  suffix = "9m2mo5"

  # ACR requires lowercase alphanumeric only
  acr_name = "bl${local.suffix}acr"

  aca_env_name = "bl-${local.suffix}-aca-env"

  uami_name         = "bl-${local.suffix}-uami"
  aca_service_name  = "bl-${local.suffix}-svc"
  aca_consumer_name = "bl-${local.suffix}-consumer"

  tags = {
    project     = var.project_name
    environment = var.environment
    managedBy   = "terraform"
  }
}
