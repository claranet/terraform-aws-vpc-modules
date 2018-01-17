output "vpc_id" {
  description = "The VPC ID"
  value       = "${aws_vpc.vpc.id}"
}

output "internet_gateway_id" {
  description = "The Internet Gateway ID"
  value       = "${aws_internet_gateway.igw.id}"
}
