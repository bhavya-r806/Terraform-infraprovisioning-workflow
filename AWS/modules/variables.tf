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
  description = "Map of public subnet names to CIDR blocks"
  type        = map(string)
}

variable "private_subnets" {
  description = "Map of private subnet names to CIDR blocks"
  type        = map(string)
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}
