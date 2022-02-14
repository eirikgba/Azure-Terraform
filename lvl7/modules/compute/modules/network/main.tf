resource "azurerm_virtual_network" "vnet" {
    resource_group_name     = var.resource_group_name
    location                = var.location
    name                    = "web-vnet"
    address_space           = var.vnet_address
}

resource "azurerm_subnet" "subnet" {
    for_each                = var.subnet
    resource_group_name     = var.resource_group_name
    virtual_network_name    = azurerm_virtual_network.vnet.name
    name                    = each.key
    address_prefixes        = each.value

    depends_on          = [azurerm_virtual_network.vnet]
}

