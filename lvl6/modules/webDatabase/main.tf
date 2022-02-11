resource "random_string" "password" {
    length           = 16
    special          = true
}

resource "azurerm_sql_server" "sql_web" {
    name                         = "sql-webserver"
    resource_group_name          = var.web_resource_group_name
    location                     = var.location
    version                      = "12.0"
    administrator_login          = "adminLogin"
    administrator_login_password = random_string.password.result                         //Must have 1 secure long Pasword!!!
}


resource "azurerm_storage_account" "web_sa" {
    name                     = "webserverstorageaccount"
    resource_group_name      = var.web_resource_group_name
    location                 = var.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    }


resource "azurerm_sql_database" "sqldb" {
    name                = "SQL-db"
    resource_group_name = var.web_resource_group_name
    location            = var.location
    server_name         = azurerm_sql_server.sql_web.name
    edition             = "Basic"

    depends_on = [azurerm_sql_server.sql_web]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
    name                = "SQL-vnet-rule"
    resource_group_name = var.web_resource_group_name
    server_name         = azurerm_sql_server.sql_web.name
    subnet_id           = var.subnet_id
    
    depends_on = [azurerm_sql_server.sql_web]
}


#Redis Cache
resource "azurerm_redis_cache" "redis_cache" {
    name                = "Redis-cache-web"
    location            = var.location
    resource_group_name = var.web_resource_group_name
    capacity            = 0
    family              = "C"
    sku_name            = "Basic"
    
    #private_static_ip_address = "192.168.1.125"
    #subnet connection is only available when using the premium SKU
    #The subnet can only contain the Azure cache for redis
    #subnet_id          = 

    redis_configuration {
    }
}