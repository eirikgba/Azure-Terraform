
#Base Variables
variable "resource_group_name" {
    type        = string
    default     = ""
}

variable "location" {
    type        = string
    default     = ""
}


variable "subnet_id" {
    type        = string
    default     = ""
}

#App service plan
variable "plan_name" {
    type        = string
    default     = "appservice-plan"
}

variable "plan_sku_tier" {
    type        = string
    default     = "Standard"
                        #"Basic"
}

variable "plan_sku_size" {
    type        = string
    default     = "S1"
                        #"B1"
}


#App service
variable "app_name" {
    type        = string
    default     = "eirikgba-apps-test1"
}

