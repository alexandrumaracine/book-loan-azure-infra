locals {
  resource_group_name = "${var.project_name}-${var.environment}-rg"

  tags = {
    project     = var.project_name
    environment = var.environment
    managedBy   = "terraform"
  }
}
