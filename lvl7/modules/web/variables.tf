variable "resource_group_name" {
    type    = string
    default = "web_resource_group"
}


variable "location" {
    type    = string
    default = ""
}

variable "nr_web_server" {
    type    = number
    default = 2
}