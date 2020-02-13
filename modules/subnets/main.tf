resource "aws_subnet" "subnets" {
  count = var.subnet_count

  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.cidr_block, ceil(log(var.subnet_count, 2)), count.index)
  availability_zone = element(var.availability_zones, count.index)

  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(var.tags, lookup(var.tags_for_resource, "aws_subnet", {}))
}

resource "aws_route_table" "default" {
  count = var.subnet_count

  vpc_id           = var.vpc_id
  propagating_vgws = var.propagating_vgws

  tags = merge(var.tags, lookup(var.tags_for_resource, "aws_route_table", {}))
}

resource "aws_route_table_association" "default" {
  count = var.subnet_count

  subnet_id      = element(aws_subnet.subnets.*.id, count.index)
  route_table_id = element(aws_route_table.default.*.id, count.index)
}
