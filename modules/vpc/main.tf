data "aws_region" "current" {}

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = lookup(var.tags_for_resource, "aws_vpc", var.tags)
}

resource "aws_default_route_table" "vpc" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  tags                   = lookup(var.tags_for_resource, "aws_default_route_table", var.tags)
}

resource "aws_vpc_dhcp_options" "vpc" {
  domain_name = coalesce(
    var.domain_name,
    "${data.aws_region.current.name}.compute.internal",
  )
  domain_name_servers = var.domain_name_servers
  tags                = lookup(var.tags_for_resource, "aws_vpc_dhcp_options", var.tags)
}

resource "aws_vpc_dhcp_options_association" "vpc_dhcp" {
  vpc_id          = aws_vpc.vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.vpc.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = lookup(var.tags_for_resource, "aws_internet_gateway", var.tags)
}
