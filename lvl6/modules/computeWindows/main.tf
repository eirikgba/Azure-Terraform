resource "random_password" "password" {
    length           = 16
    special          = true
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
    name                = "Compute-windows-vm"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
    size                = "Standard_F2"
    admin_username      = "adminuser"
    admin_password      = random_password.password
    network_interface_ids = [
        nic_id,
    ]

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
    }
}