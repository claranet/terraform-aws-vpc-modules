output "subnet_count" {
  description = "The number of subnets"
  value       = var.subnet_count
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = module.subnets.subnet_ids
}

output "route_table_ids" {
  description = "List of route table IDs"
  value       = module.subnets.route_table_ids
}
