output "subnet_count" {
  description = "The number of subnets"
  value       = var.subnet_count
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = aws_subnet.subnets.*.id
}

output "route_table_ids" {
  description = "List of route table IDs"
  value       = aws_route_table.default.*.id
}
