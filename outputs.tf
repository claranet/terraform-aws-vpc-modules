# VPC outputs

output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "internet_gateway_id" {
  description = "The Internet Gateway ID"
  value       = module.vpc.internet_gateway_id
}

# Public subnet outputs

output "public_subnet_count" {
  description = "The number of public subnets"
  value       = module.public_subnets.subnet_count
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.public_subnets.subnet_ids
}

output "public_route_table_ids" {
  description = "List of public route table IDs"
  value       = module.public_subnets.route_table_ids
}

# Private subnet outputs

output "private_subnet_count" {
  description = "The number of private subnets"
  value       = module.private_subnets.subnet_count
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.private_subnets.subnet_ids
}

output "private_route_table_ids" {
  description = "List of private route table IDs"
  value       = module.private_subnets.route_table_ids
}
