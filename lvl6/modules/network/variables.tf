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

# Virtual Network
variable "vnet_web" {
    type    = string
    default = "webpage_vnet"
}

variable "vnet_compute" {
    type    = string
    default = "compute_vnet"
}

variable "vnet_compute_db" {
    type    = string
    default = "compute_db_vnet"
}

##########################
#   Web Page resources   #
##########################

#Web Page subnets
variable "subnet_web_server" {
    type    = string
    default = "WebServerSubnet"
}

variable "subnet_web_db" {
    type    = string
    default = "WebDatabaseSubnet"
}

variable "subnet_web_server" {
    type    = string
    default = "WebLoadBalancerSubnet"
}

# Number of Web servers
variable "nr_web_server" {
    type    = number
    default = 2
}


##########################
#   Compute resources    #
##########################

#Compute subnet
variable "subnet_compute_linux" {
    type    = string
    default = "LinuxComputeSubnet"
}

variable "subnet_compute_windows" {
    type    = string
    default = "WindowsComputeSubnet"
}

variable "subnet_compute_ml" {
    type        = string
    default     = "MLComputeSubnet"
    description = "Machine Learning Subnet"
}

