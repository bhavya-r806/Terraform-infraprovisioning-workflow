variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  type = number
}

variable "private_subnets" {
  type = number
}

variable "subnet_newbits" {
  description = "Subnet size bits"
  type        = number
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}

variable "Environment" {
  description = "Deployment environment (dev/qa/prod)"
  type        = string
}
