output "web_server_subnet_id" {
    value = azurerm_subnet.web_server_subnet.id
}

output "web_db_subnet_id" {
    value = azurerm_subnet.web_db_subnet.id
}

output "web_server_subnet_id" {
    value = azurerm_subnet.web_lb_subnet.id
}

output "web_server_subnet_id" {
    value = azurerm_subnet.compute_linux_subnet.id
}

output "web_server_subnet_id" {
    value = azurerm_subnet.compute_windows_subnet.id
}

output "web_server_subnet_id" {
    value = azurerm_subnet.compute_ml_subnet.id
}

output "web_server_subnet_id" {
    value = azurerm_subnet.compute_db_subnet.id
}