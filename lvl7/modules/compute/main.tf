resource "azurerm_resource_group" "compute" {
    name           = var.resource_group_name
    location       = var.location
}

module "network" {
    source                      = "./modules/network"
    location                    = var.location
    resource_group_name         = var.resource_group_name
}

module "linux" {
    source                      = "./modules/linux"
    location                    = var.location
    resource_group_name         = var.resource_group_name
    subnet_id                   = module.network.subnet_linux_id
    nr_vm                       = var.nr_linux_vm
}

module "windows" {
    source                      = "./modules/windows"
    location                    = var.location
    resource_group_name         = var.resource_group_name
    subnet_id                   = module.network.subnet_windows_id
    nr_vm                       = var.nr_windows_vm
}
/*
module "ml" {
    source                      = "./modules/ml"
    location                    = var.location
    resource_group_name         = var.resource_group_name
    subnet_id                   = module.network.subnet_ml_id
}
*/