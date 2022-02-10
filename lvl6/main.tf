resource "azurerm_resource_group" "web" {
    name           = var.web_resource_group_name
    location       = var.location
}

resource "azurerm_resource_group" "compute" {
    name           = var.compute_resource_group_name
    location       = var.location
}


#Module for networking
module "network" {
    source                      = "./modules/network"
    location                    = var.location
    web_resource_group_name     = var.web_resource_group_name
    compute_resource_group_name = var.compute_resource_group_name

    depends_on                  = [azurerm_resource_group.web, azurerm_resource_group.compute]
}


##########################
#   Web Page resources   #
##########################

#Module for web servers to launch Web page
module "web_server" {
    source                      = "./modules/webserver"
    location                    = var.location
    web_resource_group_name     = var.web_resource_group_name
    subnet_id                   = module.network.web_server_subnet_id

    depends_on                  = [azurerm_resource_group.web]
}

#Module for SQL db and redis cache fro Web page
module "web_db" {
    source                  = "./modules/webDatabase"
    location                = var.location
    web_resource_group_name = var.web_resource_group_name
    
    subnet_id               = module.network.web_db_subnet_id
    depends_on              = [azurerm_resource_group.web]
}

# Module for LaodBalncer for the Web servers
module "web_lb" {
    source                  = "./modules/webLoadBalancer"
    location                = var.location
    web_resource_group_name = var.web_resource_group_name
    subnet_id               = module.network.web_lb_subnet_id
    depends_on              = [azurerm_resource_group.web]
}

##########################
#   Compute resources    #
##########################

# Module for Windows Compute VMs
module "compute_windows" {
    source                      = "./modules/computeWindows"
    location                    = var.location
    compute_resource_group_name = var.compute_resource_group_name
    subnet_id                   = module.network.compute_windows_subnet_id
    depends_on                  = [azurerm_resource_group.compute]
}

# Module for Linux Compute VMs
module "compute_linux" {
    source                      = "./modules/computeLinux"
    location                    = var.location
    compute_resource_group_name = var.compute_resource_group_name
    subnet_id                   = module.network.compute_linux_subnet_id
    depends_on                  = [azurerm_resource_group.compute]
}

# Module for Machine Learning
module "compute_ml" {
    source                      = "./modules/computeML"
    location                    = var.location
    compute_resource_group_name = var.compute_resource_group_name
    subnet_id                   = module.network.compute_ml_subnet_id
    depends_on                  = [azurerm_resource_group.compute]
}

# Module for Cosmos DB - MongoDB
module "compute_db" {
    source                      = "./modules/computeDB"
    location                    = var.location
    compute_resource_group_name = var.compute_resource_group_name
    subnet_id                   = module.network.compute_db_subnet_id
    depends_on                  = [azurerm_resource_group.compute]
}
