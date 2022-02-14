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


resource "azurerm_linux_virtual_machine" "example" {
    count               = var.nr_vm
    name                = "linux-compute-${count.index+1}"
    resource_group_name = var.resource_group_name
    location            = var.location
    size                = "Standard_F2"
    admin_username      = "adminuser"
    network_interface_ids = [
        azurerm_network_interface.nic[count.index].id,
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