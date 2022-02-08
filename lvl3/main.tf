/*
*Azure VM scale set Linux
* using variables
*/

resource "azurerm_resource_group" "lvl3" {
    name           = var.resource_group_name
    location       = var.location
}

resource "azurerm_virtual_network" "lvl3" {
    name                = "exmpl-network-lvl3"
    resource_group_name = var.resource_group_name
    location            = var.location
    address_space       = var.address_space
}

resource "azurerm_subnet" "internal" {
    name                    = "internal"
    resource_group_name     = var.resource_group_name
    virtual_network_name    = azurerm_virtual_network.lvl3.name
    address_prefixes          = var.address_prefix
}

resource "azurerm_linux_virtual_machine_scale_set" "lvl3" {
  name                = "lvl3-exmpl-vm-scale"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  instances           = 1
  admin_username      = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = var.storage_ac_type
    caching              = var.cache
  }

  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.internal.id
    }
  }
}
