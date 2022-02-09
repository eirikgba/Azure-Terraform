#General variable
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

variable "subnet_id" {
    type        = string
    default     = ""
}


#SQL server
variable "sql_server_name" {
    type    = string
    default = "eirikgbasqlserver"
}

variable "sql_version" {
    type    = string
    default = "12.0"
}

#Storage Account
variable "sa_name" {
    type    = string
    default = "storageactestbasicwebp"
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

#SQL vnet rule
variable "sql_vnet" {
    type    = string
    default = "sql-vnet-rule"
}

#Redis Cache
variable "cache_name" {
    type        = string
    default     = "redis-cache-eks"
}

variable "cache_capacity" {
    type        = number
    default     = 0
}

variable "cache_family" {
    type        = string
    default     = "C"
}

variable "cache_sku" {
    type        = string
    default     = "Basic"
}