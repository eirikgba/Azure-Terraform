resource "azurerm_virtual_network" "vnet" {
    resource_group_name     = var.resource_group_name
    location                = var.location
    name                    = "web-vnet"
    address_space           = var.vnet_address
}

resource "azurerm_subnet" "subnet_server" {
    resource_group_name     = var.resource_group_name
    virtual_network_name    = azurerm_virtual_network.vnet.name
    name                    = "web-server-subnet"
    address_prefixes        = var.subnet_prefixes_server

    depends_on          = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "subnet_lb" {
    resource_group_name     = var.resource_group_name
    virtual_network_name    = azurerm_virtual_network.vnet.name
    name                    = "web-loadbalancer-subnet"
    address_prefixes        = var.subnet_prefixes_lb

    depends_on          = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "subnet_db" {
    resource_group_name     = var.resource_group_name
    virtual_network_name    = azurerm_virtual_network.vnet.name
    name                    = "web-database-subnet"
    address_prefixes        = var.subnet_prefixes_db

    depends_on          = [azurerm_virtual_network.vnet]
}



/*
resource "azurerm_subnet" "subnet_server" {
    resource_group_name     = var.resource_group_name
    virtual_network_name    = var.vnet_name                 
                                //or: azurerm_virtual_network.vnet1.name
    name                    = var.subnet_name
    address_prefixes        = var.subnet_prefixes

    #To connect the sql to the subnet
    service_endpoints       = ["Microsoft.Sql"]

    depends_on          = [azurerm_virtual_network.vnet1]
}
*/