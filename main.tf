# Define the Azure provider
provider "azurerm" {
  features {}
}

data "azurerm_virtual_network" "centro" {
  name                = "${var.vnet_name}"
  resource_group_name = "${var.resource_group_name}"
}

data "azurerm_subnet" "centro" {
  name                 = "${var.subnet_name}"
  virtual_network_name = data.azurerm_virtual_network.centro.name
  resource_group_name  = "${var.resource_group_name}"
}

resource "azurerm_network_security_group" "centro" {
  name                = "${var.os_name}-nsg"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

}

resource "azurerm_network_interface" "centro" {
  name                = "${var.os_name}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

ip_configuration {
    name                          = "centroEdge-ip-config"
    subnet_id                     = data.azurerm_subnet.centro.id
    private_ip_address_allocation = "Dynamic"
   
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id     = azurerm_network_interface.centro.id
  network_security_group_id = azurerm_network_security_group.centro.id
}
# Define the virtual machine
resource "azurerm_virtual_machine" "example" {
  name                  = "${var.os_name}"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  network_interface_ids = [azurerm_network_interface.centro.id] 
  vm_size               = "${var.vm_size}"
  # Define other VM properties like size, OS, etc.
  storage_image_reference {
    publisher = "${var.source_image.publisher}"
    offer     = "${var.source_image.offer}"
    sku       = "${var.source_image.sku}"
    version   = "${var.source_image.version}"
  } 

  os_profile {
    computer_name  = "${var.os_name}"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
  }
  
  os_profile_windows_config {
    provision_vm_agent = true  # To enable the Azure VM Agent extension
  }
  
  storage_os_disk {
    name              =  "${var.os_name}"
    create_option     = "FromImage"
    caching              = "ReadWrite"
    managed_disk_type   = "${var.disk_specification}"
  }

} 


