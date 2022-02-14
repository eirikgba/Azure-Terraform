variable "resource_group_name" {
    type    = string
    default = "compute_resource_group"
}


variable "location" {
    type    = string
    default = ""
}

variable "nr_linux_vm" {
    type    = number
    default = 2
}

variable "nr_windows_vm" {
    type    = number
    default = 2
}

