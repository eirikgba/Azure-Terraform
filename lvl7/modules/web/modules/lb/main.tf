resource "azurerm_public_ip" "lb_ip" {
    name                = "PublicIPForLBWebPage"
    location            = var.location
    resource_group_name = var.resource_group_name
    allocation_method   = "Static"
}

resource "azurerm_lb" "web_lb" {
    name                = "web-page-loadbalncer"
    location            = var.location
    resource_group_name = var.resource_group_name

    frontend_ip_configuration {
        name                 = "PublicIPAddress"
        public_ip_address_id = azurerm_public_ip.lb_ip.id
    }
}