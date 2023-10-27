variable "resource_group_name" {
  default = "rg-centro-admin-spoke-test-001"
}

variable "location" {
  default = "South Central US"
}

variable "vnet_name" {
  default = "vnet-centro-admin-spoke-test-001"
}

variable "subnet_name" {
  default = "snet-centro-admin-test-spe2-004"
}

variable "os_name" {
  default =  "AZRTDSOSEDGE03"
}

variable "vm_size" {
  default =  "Standard_D8s_V3"
}


variable "disk_specification" {
  default = "StandardSSD_LRS"
}

variable "username" {
  default = "rtdsadmin"
}
variable "password" {
  default = "L0C4L$dmin!_rtds"
}

variable "source_image" {
  description = "The source image reference for the virtual machine."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "win10-22h2-pro-g2"
    version   = "latest"
  }
}