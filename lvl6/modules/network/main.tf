##########################
#   Web Page resources   #
##########################
resource "azurerm_virtual_network" "website_vnet" {
    resource_group_name     = var.web_resource_group_name
    location                = var.location
    name                    = var.vnet_web
    address_space           = var.web_address_space
}

# web server
resource "azurerm_subnet" "web_server_subnet" {
    resource_group_name     = var.web_resource_group_name
    virtual_network_name    = var.vnet_web                
                                //or: azurerm_virtual_network.vnet1.name
    name                    = var.subnet_web_server
    address_prefixes        = var.web_server_subnet_prefixes

    depends_on          = [azurerm_virtual_network.website_vnet]
}

resource "azurerm_network_interface" "web_servier_nic" {
    name                = "web_server_nic"
    location            = var.location
    resource_group_name = var.web_resource_group_name

    ip_configuration {
        name                          = "Internal"
        subnet_id                     = azurerm_subnet.web_server_subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}

# Web Load Balancer
resource "azurerm_subnet" "web_lb_subnet" {
    resource_group_name     = var.web_resource_group_name
    virtual_network_name    = var.vnet_web                 
                                //or: azurerm_virtual_network.vnet1.name
    name                    = var.subnet_web_lb
    address_prefixes        = var.web_lb_subnet_prefixes

    depends_on          = [azurerm_virtual_network.website_vnet]
}

resource "azurerm_network_interface" "web_lb_nic" {
    name                = "web_lb_nic"
    location            = var.location
    resource_group_name = var.web_resource_group_name

    ip_configuration {
        name                          = "Internal"
        subnet_id                     = azurerm_subnet.web_lb_subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}

# Web database
resource "azurerm_subnet" "web_db_subnet" {
    resource_group_name     = var.web_resource_group_name
    virtual_network_name    = var.vnet_web                 
                                //or: azurerm_virtual_network.vnet1.name
    name                    = var.subnet_web_db
    address_prefixes        = var.web_db_subnet_prefixes

    #To connect the sql to the subnet
    service_endpoints       = ["Microsoft.Sql"]

    depends_on          = [azurerm_virtual_network.website_vnet]
}

resource "azurerm_network_interface" "web_db_nic" {
    name                = "web_db_nic"
    location            = var.location
    resource_group_name = var.web_resource_group_name

    ip_configuration {
        name                          = "Internal"
        subnet_id                     = azurerm_subnet.web_db_subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}

##########################
#   Compute resources    #
##########################
resource "azurerm_virtual_network" "compute_vnet" {
    resource_group_name     = var.compute_resource_group_name
    location                = var.location
    name                    = var.vnet_compute
    address_space           = var.compute_address_space
}

# Linux subnet
resource "azurerm_subnet" "compute_linux_subnet" {
    resource_group_name     = var.compute_resource_group_name
    virtual_network_name    = var.vnet_compute               
                                //or: azurerm_virtual_network.vnet1.name
    name                    = var.subnet_compute_linux
    address_prefixes        = var.compute_linux_subnet_prefixes

    depends_on          = [azurerm_virtual_network.compute_vnet]
}

resource "azurerm_network_interface" "compute_linux_nic" {
    name                = "compute_linux_nic"
    location            = var.location
    resource_group_name = var.compute_resource_group_name

    ip_configuration {
        name                          = "Internal"
        subnet_id                     = azurerm_subnet.compute_linux_subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}

# Windows subnet
resource "azurerm_subnet" "compute_windows_subnet" {
    resource_group_name     = var.compute_resource_group_name
    virtual_network_name    = var.vnet_compute               
                                //or: azurerm_virtual_network.vnet1.name
    name                    = var.subnet_compute_linux
    address_prefixes        = var.compute_linux_subnet_prefixes

    depends_on          = [azurerm_virtual_network.compute_vnet]
}

resource "azurerm_network_interface" "compute_windows_nic" {
    name                = "compute_windows_nic"
    location            = var.location
    resource_group_name = var.compute_resource_group_name

    ip_configuration {
        name                          = "Internal"
        subnet_id                     = azurerm_subnet.compute_windows_subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}

# ML subnet
resource "azurerm_subnet" "compute_ml_subnet" {
    resource_group_name     = var.compute_resource_group_name
    virtual_network_name    = var.vnet_compute               
                                //or: azurerm_virtual_network.vnet1.name
    name                    = var.subnet_compute_ml
    address_prefixes        = var.compute_ml_subnet_prefixes

    depends_on          = [azurerm_virtual_network.compute_vnet]
}

resource "azurerm_network_interface" "compute_ml_nic" {
    name                = "compute_ml_nic"
    location            = var.location
    resource_group_name = var.compute_resource_group_name

    ip_configuration {
        name                          = "Internal"
        subnet_id                     = azurerm_subnet.compute_ml_subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}


# Compute DB
resource "azurerm_virtual_network" "compute_db_vnet" {
    resource_group_name     = var.compute_resource_group_name
    location                = var.location
    name                    = var.vnet_compute_db
    address_space           = var.compute_db_address_space
}

resource "azurerm_subnet" "compute_db_subnet" {
    resource_group_name     = var.compute_resource_group_name
    virtual_network_name    = var.vnet_compute_db                
                                //or: azurerm_virtual_network.vnet1.name
    name                    = var.subnet_compute_db
    address_prefixes        = var.compute_db_address_space

    depends_on          = [azurerm_virtual_network.compute_db_vnet]
}

resource "azurerm_network_interface" "compute_db_nic" {
    name                = "compute_db_nic"
    location            = var.location
    resource_group_name = var.compute_resource_group_name

    ip_configuration {
        name                          = "Internal"
        subnet_id                     = azurerm_subnet.compute_db_subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}