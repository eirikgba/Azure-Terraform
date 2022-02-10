# General var - from root
variable "web_resource_group_name" {
    type    = string
    default = ""
}

variable "compute_resource_group_name" {
    type    = string
    default = ""
}

variable "location" {
    type    = string
    default = ""
}

/*
variable "" {
    type    = string
    default = ""
}
*/

##########################
#   Web Page resources   #
##########################
# Virtual Network
variable "vnet_web" {
    type    = string
    default = "webpage_vnet"
}

variable "web_address_space" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

#Web Page subnets
variable "subnet_web_server" {
    type    = string
    default = "WebServerSubnet"
}

variable "web_server_subnet_prefixes" {
    type    = list(string)
    default = ["10.0.1.0/24"]
}

variable "subnet_web_db" {
    type    = string
    default = "WebDatabaseSubnet"
}

variable "web_db_subnet_prefixes" {
    type    = list(string)
    default = ["10.0.2.0/24"]
}

variable "subnet_web_lb" {
    type    = string
    default = "WebLoadBalancerSubnet"
}

variable "web_lb_subnet_prefixes" {
    type    = list(string)
    default = ["10.0.3.0/24"]
}


##########################
#   Compute resources    #
##########################
# Virtual Network
variable "vnet_compute" {
    type    = string
    default = "compute_vnet"
}

variable "compute_address_space" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

variable "vnet_compute_db" {
    type    = string
    default = "compute_db_vnet"
}

variable "compute_db_address_space" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

#Compute subnet
variable "subnet_compute_linux" {
    type    = string
    default = "LinuxComputeSubnet"
}

variable "compute_linux_subnet_prefixes" {
    type    = list(string)
    default = ["10.0.3.0/24"]
}

variable "subnet_compute_windows" {
    type    = string
    default = "WindowsComputeSubnet"
}

variable "compute_windows_subnet_prefixes" {
    type    = list(string)
    default = ["10.0.3.0/24"]
}

variable "subnet_compute_ml" {
    type        = string
    default     = "MLComputeSubnet"
    description = "MachineLearningSubnet"
}

variable "compute_ml_subnet_prefixes" {
    type    = list(string)
    default = ["10.0.3.0/24"]
}

variable "subnet_compute_db" {
    type        = string
    default     = "MLComputeSubnet"
    description = "ComputeDatabaseSubnet"
}
variable "compute_db_subnet_prefixes" {
    type    = list(string)
    default = ["10.0.3.0/24"]
}