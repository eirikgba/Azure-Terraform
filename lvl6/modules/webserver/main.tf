resource "azurerm_linux_virtual_machine" "web_server" {
    name                = "web-server"
    resource_group_name = var.web_resource_group_name
    location            = var.location
    size                = "Standard_F2"
    admin_username      = "adminuser"
    network_interface_ids = [
        var.nic_id,
    ]

    admin_ssh_key {
        username   = "adminuser"
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04-LTS"
        version   = "latest"
    }
}