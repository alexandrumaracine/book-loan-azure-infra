module "rg" {
  source   = "./modules/rg"
  name     = local.resource_group_name
  location = var.location
  tags     = local.tags
}
