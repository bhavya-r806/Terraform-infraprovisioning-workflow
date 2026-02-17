region = "us-east-1"

vpc_name = "qa-vpc"
vpc_cidr = "10.20.0.0/23"

public_subnet_count  = 2
private_subnet_count = 2

subnet_newbits = 2   # /23 → /25

tags = {
  Environment = "qa"
  ManagedBy  = "Terraform"
}
