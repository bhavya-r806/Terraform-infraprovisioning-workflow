output "vpc_id" {
  value = aws_vpc.network.id
}

output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}

