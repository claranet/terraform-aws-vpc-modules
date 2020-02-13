module "subnets" {
  source = "../subnets"

  vpc_id             = var.vpc_id
  cidr_block         = var.cidr_block
  subnet_count       = var.subnet_count
  availability_zones = var.availability_zones
  propagating_vgws   = var.propagating_vgws
  tags               = var.tags
  tags_for_resource  = var.tags_for_resource
}

resource "aws_route" "nat_gateway" {
  count = var.nat_gateway_count

  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = element(module.subnets.route_table_ids, count.index)
  nat_gateway_id         = element(var.nat_gateway_ids, count.index)
}
