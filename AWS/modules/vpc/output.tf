output "public_subnet_ids" {
  value = [
    for k, v in aws_subnet.subnets : v.id
    if contains(keys(local.public_subnet_count), k)
  ]
}

output "private_subnet_ids" {
  value = [
    for k, v in aws_subnet.subnets : v.id
    if contains(keys(local.private_subnet_count), k)
  ]
}

