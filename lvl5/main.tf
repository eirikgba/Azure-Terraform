
resource "azurerm_resource_group" "lvl5" {
    name           = var.resource_group_name
    location       = var.location
}

#Module for networking
module "network" {
    source              = "./modules/network"
    location            = var.location
    resource_group_name = var.resource_group_name

    depends_on          = [azurerm_resource_group.lvl5]
}

#Module for AppService to launch Web page
module "app" {
    source              = "./modules/appService"
    location            = var.location
    resource_group_name = var.resource_group_name

    depends_on          = [azurerm_resource_group.lvl5]
}

#Module for SQL db and redis cache
module "sql" {
    source              = "./modules/sql"
    location            = var.location
    resource_group_name = var.resource_group_name
    
    subnet_id           = module.network.subnet_id
    depends_on          = [azurerm_resource_group.lvl5]
}


