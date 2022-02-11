variable "resource_group_name" {
    type    = string
    default = ""
}


variable "location" {
    type    = string
    default = ""
}

variable "subnet_id" {
    type    = string
    default = ""
}

variable "sql_version" {
    type    = string
    default = "12.0"
}

variable "sa_acc_tier" {
    type    = string
    default = "Standard"
}

variable "sa_replic_type" {
    type    = string
    default = "LRS"
}

variable "db_edition" {
    type        = string
    default     = "Basic"
}