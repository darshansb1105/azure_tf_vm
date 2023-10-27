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

variable "os_type" {
  description = "Operating System type (e.g., Linux or Windows)"
}

variable "os_name" {
  default =  "AZRTDSOSEDGE02"
}

variable "disk_specification" {
  default = "Standard SSD LRS"
}

variable "username" {
  default = "rtdsadmin"
}
variable "password" {
  default = "L0C4L$dmin!_rtds"
}
