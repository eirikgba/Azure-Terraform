resource "azurerm_resource_group" "web" {
    name           = var.resource_group_name
    location       = var.location
}

module "network" {
    source                      = "./modules/network"
    location                    = var.location
    resource_group_name         = var.resource_group_name
    nr_web_server               = var.nr_web_server
}

module "web_server" {
    source                      = "./modules/web_server"
    location                    = var.location
    resource_group_name         = var.resource_group_name
    nr_web_server               = var.nr_web_server
    subnet_id                   = module.network.subnet_server_id
}


module "web_lb" {
    source                      = "./modules/lb"
    location                    = var.location
    resource_group_name         = var.resource_group_name
    subnet_id                   = module.network.subnet_lb_id
}


module "web_db" {
    source                      = "./modules/db"
    location                    = var.location
    resource_group_name         = var.resource_group_name
    subnet_id                   = module.network.subnet_db_id
}
