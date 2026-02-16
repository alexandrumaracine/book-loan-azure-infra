module "rg" {
  source   = "./modules/rg"
  name     = local.resource_group_name
  location = var.location
  tags     = local.tags
}

module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = module.rg.name
  location            = module.rg.location
  name_prefix         = "${var.project_name}-${var.environment}"
  retention_in_days   = 30
  tags                = local.tags
}

module "acr" {
  source = "./modules/acr"

  name                = local.acr_name
  resource_group_name = module.rg.name
  location            = module.rg.location
}

module "aca_env" {
  source = "./modules/aca-env"

  name                       = local.aca_env_name
  resource_group_name        = module.rg.name
  location                   = module.rg.location
  log_analytics_workspace_id = module.monitoring.log_analytics_workspace_id
}


resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}
