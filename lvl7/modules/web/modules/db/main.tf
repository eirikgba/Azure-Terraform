#SQL server and Database
resource "random_password" "sql_server" {
    length           = 16
    special          = true
    override_special = "_%@"
}

resource "azurerm_sql_server" "sql_web" {
    name                         = "sql-server-web"
    resource_group_name          = var.resource_group_name
    location                     = var.location
    version                      = var.sql_version
    administrator_login          = "adminLogin"
    administrator_login_password = random_password.sql_server.result             //Must have a secure long Pasword!!!
}


resource "azurerm_storage_account" "sa" {
    name                     = "webdbstorageaccount"
    resource_group_name      = var.resource_group_name
    location                 = var.location
    account_tier             = var.sa_acc_tier
    account_replication_type = var.sa_replic_type
    }


resource "azurerm_sql_database" "sqldb" {
    name                = "web-SQLdb"
    resource_group_name = var.resource_group_name
    location            = var.location
    server_name         = azurerm_sql_server.sql_web.name
    edition             = var.db_edition
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
    name                = "SQL-vnet"
    resource_group_name = var.resource_group_name
    server_name         = azurerm_sql_server.sql_web.name
    subnet_id           = var.subnet_id
}


#Redis Cache
/*
resource "azurerm_redis_cache" "cache" {
    name                = var.cache_name
    location            = var.location
    resource_group_name = var.resource_group_name
    capacity            = var.cache_capacity
    family              = var.cache_family
    sku_name            = var.cache_sku
    
    private_static_ip_address = "192.168.1.125"
    #subnet connection is only available when using the premium SKU
    #The subnet can only contain the Azure cache for redis
    #subnet_id          = 

    redis_configuration {
    }
}
*/