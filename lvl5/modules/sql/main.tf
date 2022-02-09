#SQL server and Database
resource "azurerm_sql_server" "sqlWeb" {
    name                         = var.sql_server_name
    resource_group_name          = var.resource_group_name
    location                     = var.location
    version                      = var.sql_version
    administrator_login          = "adminLogin"
    administrator_login_password = ""                         //Must have a secure long Pasword!!!
}


resource "azurerm_storage_account" "example" {
    name                     = var.sa_name
    resource_group_name      = var.resource_group_name
    location                 = var.location
    account_tier             = var.sa_acc_tier
    account_replication_type = var.sa_replic_type
    }


resource "azurerm_sql_database" "sqldb" {
    name                = var.db_name
    resource_group_name = var.resource_group_name
    location            = var.location
    server_name         = var.sql_server_name
    edition             = var.db_edition

    depends_on = [azurerm_sql_server.sqlWeb]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
    name                = var.sql_vnet
    resource_group_name = var.resource_group_name
    server_name         = var.sql_server_name
    subnet_id           = var.subnet_id
}


#Redis Cache
resource "azurerm_redis_cache" "example" {
    name                = var.cache_name
    location            = var.location
    resource_group_name = var.resource_group_name
    capacity            = var.cache_capacity
    family              = var.cache_family
    sku_name            = var.cache_sku

    redis_configuration {
    }
}