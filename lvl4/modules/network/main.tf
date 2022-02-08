
resource "azurerm_virtual_network" "vnet1" {
    resource_group_name     = var.resource_group_name
    location                = var.location
    name                    = var.vnet_name
    address_space           = var.address_space
}

resource "azurerm_subnet" "subnet1" {
    resource_group_name     = var.resource_group_name
    virtual_network_name    = var.vnet_name                 
                                //or: azurerm_virtual_network.vnet1.name
    name                    = var.subnet_name
    address_prefixes        = var.subnet_prefixes
}

resource "azurerm_network_interface" "example" {
    name                = "nic-1"
    location            = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name                          = "Internal"
        subnet_id                     = azurerm_subnet.example.id
        private_ip_address_allocation = "Dynamic"
    }
}


/*
resource "azurerm_network_interface" "example" {
    name                = var.nic_name
    location            = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name                          = var.ip_conf_name
        subnet_id                     = azurerm_subnet.example.id
        private_ip_address_allocation = var.ip_alloc
    }
}
*/