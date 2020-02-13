module "subnets" {
  source = "../subnets"

  vpc_id             = var.vpc_id
  cidr_block         = var.cidr_block
  subnet_count       = var.subnet_count
  availability_zones = var.availability_zones
  propagating_vgws   = var.propagating_vgws
  tags               = var.tags
  tags_for_resource  = var.tags_for_resource

  map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_route" "internet_gateway" {
  count = var.subnet_count

  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = element(module.subnets.route_table_ids, count.index)
  gateway_id             = var.gateway_id
}
