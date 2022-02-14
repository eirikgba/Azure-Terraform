output "subnet_linux_id" {
    value = azurerm_subnet.subnet["linux_subnet"].id
}

output "subnet_windows_id" {
    value = azurerm_subnet.subnet["windows_subnet"].id
}

output "subnet_ml_id" {
    value = azurerm_subnet.subnet["ml_subnet"].id
}


/*
output "subnet" {
    value = {
        for name, address in var.subnet : 
            azurerm_subnet.subnet[name].id
    }


    #value = (element(azurerm_subnet.subnet[*].id), each.key)
    #element(azurerm_network_interface.nic.*.id, count.index)
}
*/
#for_each = var.subnet
/*
output "network_output" {
    value = azurerm_virtual_network.vnet.id
    description = "output from network in compute vnet id."
    #"${}"
}

output "subnet_linux" {
    #for_each = var.subnet
    #value = azurerm_subnet.subnet["linux_subnet"].id
    value = "${lookup(var.subnet, "linux_subnet")}"
    #element(azurerm_network_interface.nic.*.id, count.index)
}

output "subnet_windows" {
    #for_each = var.subnet
    #value = azurerm_subnet.subnet["linux_subnet"].id
    value = "${lookup(var.subnet, "windows_subnet")}"
    #element(azurerm_network_interface.nic.*.id, count.index)
}

output "subnet_ml" {
    #for_each = var.subnet
    value = azurerm_subnet.subnet["ml_subnet"].id
    #value = "${lookup(var.subnet, "ml_subnet")}"
    #element(azurerm_network_interface.nic.*.id, count.index)
}

output "subnet_ml2" {
    #for_each = var.subnet
    value = azurerm_subnet.subnet["linux_subnet"].id
    #value = "${lookup(var.subnet, "ml_subnet")}"
    #element(azurerm_network_interface.nic.*.id, count.index)
}

output "all_subnets" {
    #for_each = var.subnet
    value = "${lookup(var.subnet, "windows_subnet")}"
    #value = [for subnets in azurerm_subnet.subnet : subnets.id]
    #element(azurerm_network_interface.nic.*.id, count.index)
}

output "subnet_id" {
    #value = azurerm_subnet.subnet["linux_subnet"].id
    value = "${lookup(var.subnet, "linux_subnet")}"
}
/*
output "subnet_windows" {
    value = azurerm_subnet.subnet[1].id
    #element(azurerm_network_interface.nic.*.id, count.index)
}

output "subnet_ml" {
    value = azurerm_subnet.subnet[2].id
    #element(azurerm_network_interface.nic.*.id, count.index)
}
*/