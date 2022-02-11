resource "random_password" "password" {
    length           = 16
    special          = true
    override_special = "_%@"
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
    name                = "Compute-windows-vm"
    resource_group_name = var.compute_resource_group_name
    location            = var.location
    size                = "Standard_F2"
    admin_username      = "adminuser"
    admin_password      = random_password.password.result                //Must have 1 secure long Pasword!!!
    network_interface_ids = [
        var.nic_id,
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