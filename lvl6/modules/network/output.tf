#Web page 
#Subnet
output "web_server_subnet_id" {
    value = azurerm_subnet.web_server_subnet.id
}

output "web_db_subnet_id" {
    value = azurerm_subnet.web_db_subnet.id
}

output "web_lb_subnet_id" {
    value = azurerm_subnet.web_lb_subnet.id
}

#NIC
output "web_server_nic_id" {
    value = azurerm_network_interface.web_servier_nic.id
}

output "web_db_nic_id" {
    value = azurerm_network_interface.web_db_nic.id
}

output "web_lb_nic_id" {
    value = azurerm_network_interface.web_lb_nic.id
}

#Compute
output "compute_linux_subnet_id" {
    value = azurerm_subnet.compute_linux_subnet.id
}

output "compute_windows_subnet_id" {
    value = azurerm_subnet.compute_windows_subnet.id
}

output "compute_ml_subnet_id" {
    value = azurerm_subnet.compute_ml_subnet.id
}

output "compute_db_subnet_id" {
    value = azurerm_subnet.compute_db_subnet.id
}

output "compute_linux_nic_id" {
    value = azurerm_subnet.compute_linux_subnet.id
}

output "compute_windows_nic_id" {
    value = azurerm_subnet.compute_windows_subnet.id
}

output "compute_ml_nic_id" {
    value = azurerm_subnet.compute_ml_subnet.id
}

output "compute_db_nic_id" {
    value = azurerm_subnet.compute_db_subnet.id
}