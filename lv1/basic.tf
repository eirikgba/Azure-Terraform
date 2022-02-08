#Første terrafrom fil
#Provison a basic VM

terraform {
   required_version = ">=0.12"

   required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "<azure_subscription_id>"
  tenant_id         = "<azure_subscription_tenant_id>"
  client_id         = "<service_principal_appid>"
  client_secret     = "<service_principal_password>"
}




resource "azurerm_resource_group" "test" {
    name        = "resource-group"
    location    = "West Europe"
}

resource "azurerm_virtual_network" "test" {
    name                = "test-network"
    address_space       = [10.0.0.0/16]
    location            = azurerm_resource_group.test.location
    resource_group_name = azurerm_resource_group.test.name
}

resource "azurerm_subnet" "internal" {
    name                ="internal"
    location            = azurerm_resource_group.test.location
    resource_group_name = azurerm_resource_group.test.name
    address_prefixes    = [10.0.1.0/24]
}

resource "azurerm_network_interface" "test" {
    name                    = "test-nic"
    location            = azurerm_resource_group.test.location
    resource_group_name = azurerm_resource_group.test.name

    ip_configuration {
        name                            = "testconfig"
        subnet_id                       = azurerm_subnet.internal.id
        private_ip_adress_allocation    = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "main" {
    name                    = "test-vm"
    location                = azurerm_resource_group.test.location
    resource_group_name     = azurerm_resource_group.test.name
    network_interface_ids   = [azurerm_network_interface.test.id]
    vm_size                 = "Standard_DS1_v2"

    # Uncomment this line to delete the OS disk automatically when deleting the VM
    # delete_os_disk_on_termination = true

    # Uncomment this line to delete the data disks automatically when deleting the VM
    delete_data_disks_on_termination = true

    ######
    storage_image_referance {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04-LTS"
        version   = "latest"
    }

    storage_os_disk {
        name              = "myosdisk1"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }
    os_profile {
        computer_name  = "hostname"
        admin_username = "testadmin"
        admin_password = "Password1234!"
    }
    os_profile_linux_config {
        disable_password_authentication = false
    }
    tags = {
        environment = "staging"
    } 
}


