
variable "resource_group_name" {
    type    = string
    default = "resource_group_lv3"
}

variable "location" {
    type    = string
    default = "norwayeast"
}

variable "address_space" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

variable "address_prefix" {
    type    = list(string)
    default = ["10.0.1.0/24"]
}

variable "publisher" {
    type    = string
    default = "Canonical"
}

variable "offer" {
    type    = string 
    default = "UbuntuServer"
}

variable "sku" {
    type    = string
    default = "Standard_F2"
}

variable "storage_ac_type" {
    type    = string
    default = "Standard_LRS"
}

variable "cache" {
    type    = string
    default = "ReadWrite"
}



