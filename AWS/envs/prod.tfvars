region = "us-east-1"

vpc_name = "prod-vpc"
vpc_cidr = "10.10.0.0/23"

subnet_newbits = 2   # /23 → /25

tags = {
  Environment = "prod"
  ManagedBy   = "Terraform"
}

Environment = "prod"

