variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
}

variable "subnet_newbits" {
  description = "Number of additional bits to split the VPC CIDR"
  type        = number
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
