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

module "uami" {
  source = "./modules/identity"

  name                = local.uami_name
  resource_group_name = module.rg.name
  location            = module.rg.location
}

resource "azurerm_role_assignment" "uami_acrpull" {
  scope                = module.acr.id
  role_definition_name = "AcrPull"
  principal_id         = module.uami.principal_id
}

module "aca_service" {
  source = "./modules/aca-app"

  name                = local.aca_service_name
  resource_group_name = module.rg.name

  environment_id      = module.aca_env.id
  identity_id         = module.uami.id
  acr_login_server    = module.acr.login_server

  image               = var.service_image
  env                 = {}

   depends_on = [azurerm_role_assignment.uami_acrpull]
}

module "aca_consumer" {
  source = "./modules/aca-app"

  name                = local.aca_consumer_name
  resource_group_name = module.rg.name

  environment_id      = module.aca_env.id
  identity_id         = module.uami.id
  acr_login_server    = module.acr.login_server

  image               = var.consumer_image
  env                 = {}

   depends_on = [azurerm_role_assignment.uami_acrpull]
}




resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}
