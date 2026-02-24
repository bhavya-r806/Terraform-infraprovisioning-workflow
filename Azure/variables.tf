variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vnet_name" {
  type        = string
  description = "Virtual Network name"
}

variable "vnet_cidr" {
  type        = string
  description = "Base CIDR for the VNet"

}
variable "public_subnet_count" {
  type = number
}

variable "private_subnet_count" {
  type = number
}

variable "subnet_newbits" {
  type        = number
  description = "Controls subnet size"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}
