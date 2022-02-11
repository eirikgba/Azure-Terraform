variable "resource_group_name" {
    type    = string
    default = ""
}


variable "location" {
    type    = string
    default = ""
}

variable "nr_web_server" {
    type    = number
}

variable "vnet_address" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

variable "subnet_prefixes_server" {
    type    = list(string)
    default = ["10.0.1.0/24"]
}

variable "subnet_prefixes_lb" {
    type    = list(string)
    default = ["10.0.2.0/24"]
}

variable "subnet_prefixes_db" {
    type    = list(string)
    default = ["10.0.3.0/24"]
}