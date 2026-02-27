region = "us-east-1"

vpc_name = "qa-vpc"
vpc_cidr = "10.10.0.0/23"

public_subnet_count  = 1
private_subnet_count = 1

subnet_newbits = 2   # /23 → /25


tags = {
  ManagedBy   = "Terraform"
}

Environment = "qa"