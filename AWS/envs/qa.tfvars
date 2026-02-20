region = "us-east-1"

vpc_name = "qa-vpc"
vpc_cidr = "10.10.0.0/23"

subnet_newbits = 2   # /23 → /25

public_subnets  = 1
private_subnets = 1

tags = {
  Environment = "qa"
  ManagedBy   = "Terraform"
}

Environment = "qa"
