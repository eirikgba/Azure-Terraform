
resource "azurerm_sql_server" "sqlWeb" {
    name                         = var.sql_server_name
    resource_group_name          = var.resource_group_name
    location                     = var.location
    version                      = var.sql_version
    administrator_login          = "adminLogin"
    administrator_login_password = ""
                                            //Must have a secure long Pasword!!!
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
