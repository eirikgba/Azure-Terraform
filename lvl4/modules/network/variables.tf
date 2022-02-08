#Base Variables
variable "resource_group_name" {
    type        = string
    default     = ""
}

variable "location" {
    type        = string
    default     = ""
}

#Virtual Network Variables
variable "vnet_name" {
    type    = string
    default = "V-Net1"
}


variable "address_space" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

#Subnet varibales
variable "subnet_name" {
    type    = string
    default = "subnet1"
}

variable "subnet_prefixes" {
    type    = list(string)
    default = ["10.0.1.0/24"]
}


# Network Interface variables
variable "nic_name" {
    type    = string
    default = "nic-1"
}

variable "ip_conf_name" {
    type    = string
    default = "internal"
}

variable "ip_alloc" {
    type        = string
    default     = "Dynamic"
    description = "IP_configuration: Allocation of private ip addresses"
}

