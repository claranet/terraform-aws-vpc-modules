output "nat_gateway_count" {
  description = "The number of gateways"
  value       = var.subnet_count
}

output "nat_gateway_ids" {
  description = "List of gateway IDs"
  value       = aws_nat_gateway.natgw.*.id
}
