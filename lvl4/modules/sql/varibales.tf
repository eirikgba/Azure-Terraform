variable "resource_group_name" {
    type        = string
    default     = ""
    description = "name of resource group for all resources in lvl4"
}

variable "location" {
    type        = string
    default     = ""
    description = "norwayeast"
}

#SQL server
variable "sql_server_name" {
    type    = string
    default = "sql-server"
}

variable "sql_version" {
    type    = string
    default = "12.0"
}

#Storage Account
variable "sa_name" {
    type    = string
    default = "storageaccount"
}

variable "sa_acc_tier" {
    type    = string
    default = "Standard"
}

variable "sa_replic_type" {
    type    = string
    default = "LRS"
}

#SQL Database
variable "db_name" {
    type    = string
    default = "sql-db"
}

variable "db_edition" {
    type        = string
    default     = "Basic"
}

