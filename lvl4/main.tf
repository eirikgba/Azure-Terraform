
resource "azurerm_resource_group" "lvl4" {
    name           = var.resource_group_name
    location       = var.location
}

module "network" {
    source              = "./modules/network"
    location            = var.location
    resource_group_name =  var.resource_group_name
}

module "vms" {
    source              = "./modules/vm"
    location            = var.location
    resource_group_name = var.resource_group_name
    subnet_id           = module.network.subnet_id
}

module "sql" {
    source              = "./modules/sql"
    location            = var.location
    resource_group_name = var.resource_group_name
}


