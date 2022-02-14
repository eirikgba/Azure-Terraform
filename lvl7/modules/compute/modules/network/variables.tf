variable "resource_group_name" {
    type    = string
    default = ""
}


variable "location" {
    type    = string
    default = ""
}

variable "vnet_address" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

variable "subnet" {
    type    = map
    default = {
        "linux_subnet"      = ["10.0.1.0/24"]
        "windows_subnet"    = ["10.0.2.0/24"]
        "ml_subnet"         = ["10.0.3.0/24"]
    }
}
