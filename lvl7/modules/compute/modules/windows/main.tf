resource "azurerm_network_interface" "nic" {
    count               = var.nr_vm
    name                = "nic-${count.index+1}"
    location            = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = var.subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

#Random passowrd for Windows VM
resource "random_password" "password" {
    count            = var.nr_vm
    length           = 16
    special          = true
}

resource "azurerm_windows_virtual_machine" "example" {
    name                = "example-machine"
    resource_group_name = var.resource_group_name
    location            = var.location
    size                = "Standard_F2"
    admin_username      = "adminuser"
    admin_password      = random_password.passowrd.result
    network_interface_ids = [
        azurerm_network_interface.nic[count.index].id,
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