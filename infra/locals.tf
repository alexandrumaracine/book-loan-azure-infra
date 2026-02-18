locals {
  # Short, stable prefix for all resource names (keep it deterministic)
  # If var.project_name is "book-loan", you can keep "bl" as a separate var.project_code.
  prefix = coalesce(try(var.project_code, null), "bl")

  # Stable RG name (single env)
  resource_group_name = "${local.prefix}-rg"

  # ACR: must be globally unique + lowercase alphanumeric only.
  # Prefer a deterministic name. If "${local.prefix}acr" is already taken globally,
  # set var.acr_suffix to something stable like "40200" (or any org-specific fixed suffix).
  acr_suffix = "x7k9p2"

  acr_name   = local.acr_suffix != "" ? "${local.prefix}acr${local.acr_suffix}" : "${local.prefix}acr"

  # ACA environment + apps + identity (stable, readable)
  aca_env_name       = "${local.prefix}-aca-env"
  uami_name          = "${local.prefix}-uami"
  aca_service_name   = "${local.prefix}-svc"
  aca_consumer_name  = "${local.prefix}-consumer"

  # Monitoring (optional but common)
  log_analytics_name = "${local.prefix}-law"
  appinsights_name   = "${local.prefix}-ai"

  tags = {
    project   = var.project_name
    managedBy = "terraform"
    # optional: keep a constant if you still want this label
    environment = "single"
  }
}
