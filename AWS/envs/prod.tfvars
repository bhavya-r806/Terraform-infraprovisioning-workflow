region = "us-east-1"

vpc_name = "dev-vpc"
vpc_cidr = "10.10.0.0/23"

subnet_newbits = 2   # /23 → /25

public_subnets = 2

private_subnets = 2

Environment = "prod"


tags = {
  Environment = "prod"
  ManagedBy   = "Terraform"
}

