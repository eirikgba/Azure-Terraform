
resource "azurerm_app_service_plan" "serviceplantest" {
    name                    = var.plan_name                 #This has to be globaly unique
    location                = var.location
    resource_group_name     = var.resource_group_name

    sku {
        tier = var.plan_sku_tier
        size = var.plan_sku_size
    }
}

resource "azurerm_app_service" "example" {
    name                = var.app_name
    location            = var.location
    resource_group_name = var.resource_group_name
    app_service_plan_id = azurerm_app_service_plan.serviceplantest.id
}