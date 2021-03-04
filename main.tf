module "vpc" {
  source = "./modules/vpc"

  cidr_block           = var.vpc_cidr_block
  enable_dhcp_options  = var.enable_dhcp_options
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags              = var.tags
  tags_for_resource = var.tags_for_resource
}

module "public_subnets" {
  source = "./modules/public-subnets"

  vpc_id                  = module.vpc.vpc_id
  gateway_id              = module.vpc.internet_gateway_id
  propagating_vgws        = var.public_propagating_vgws
  map_public_ip_on_launch = var.map_public_ip_on_launch

  cidr_block         = var.public_cidr_block
  subnet_count       = var.public_subnet_count
  availability_zones = var.availability_zones

  tags              = var.tags
  tags_for_resource = var.tags_for_resource
}

module "nat_gateways" {
  source = "./modules/nat-gateways"

  subnet_count = module.public_subnets.subnet_count
  subnet_ids   = module.public_subnets.subnet_ids

  tags              = var.tags
  tags_for_resource = var.tags_for_resource
}

module "private_subnets" {
  source = "./modules/private-subnets"

  vpc_id            = module.vpc.vpc_id
  nat_gateway_count = module.nat_gateways.nat_gateway_count
  nat_gateway_ids   = module.nat_gateways.nat_gateway_ids
  propagating_vgws  = var.private_propagating_vgws

  cidr_block         = var.private_cidr_block
  subnet_count       = var.private_subnet_count
  availability_zones = var.availability_zones

  tags              = var.tags
  tags_for_resource = var.tags_for_resource
}
