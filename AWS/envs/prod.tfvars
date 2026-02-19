region = "us-east-1"

vpc_name = "dev-vpc"
vpc_cidr = "10.10.0.0/23"

public_subnets = {
  public-1 = "10.10.0.0/25"
}

private_subnets = {
  private-1 = "10.10.0.128/25"
}

tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
}

Environment = "prod"
