
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_cidr" {
  type        = string
  description = "Base CIDR for the VNet"
}

variable "subnet_newbits" {
  type = number

  validation {
    condition     = var.subnet_newbits >= 1 && var.subnet_newbits <= 6
    error_message = "subnet_newbits must produce valid Azure subnet sizes."
  }
}

variable "public_subnet_count" {
  type = number
}

variable "private_subnet_count" {
  type = number
}

variable "tags" {
  type    = map(string)
  default = {}
}

