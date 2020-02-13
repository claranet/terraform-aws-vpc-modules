# terraform-aws-vpc-modules nat-gateways

Creates an AWS NAT Gateway in each provided subnet.

## Usage

```hcl
# Create VPC

module "vpc" {
  source  = "claranet/vpc-modules/aws"
  version = "0.4.0"

  cidr_block           = "10.112.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

# Create public subnets with internet access

module "public_subnets" {
  source  = "claranet/vpc-modules/aws//modules/public-subnets"
  version = "0.4.0"

  vpc_id                  = module.vpc.vpc_id
  gateway_id              = module.vpc.internet_gateway_id
  map_public_ip_on_launch = true
  cidr_block              = "10.112.0.0/20"
  subnet_count            = 3
  availability_zones      = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

# Create NAT Gateways in public subnets

module "nat_gateways" {
  source  = "claranet/vpc-modules/aws//modules/nat-gateways"
  version = "0.4.0"

  subnet_count = module.public_subnets.subnet_count
  subnet_ids   = module.public_subnets.subnet_ids
}

# Use NAT Gateways in private subnets to provide internet access

module "private_subnets" {
  source  = "claranet/vpc-modules/aws//modules/private-subnets"
  version = "0.4.0"

  vpc_id             = module.vpc.vpc_id
  nat_gateway_count  = module.nat_gateways.nat_gateway_count
  nat_gateway_ids    = module.nat_gateways.nat_gateway_ids
  cidr_block         = "10.112.16.0/20"
  subnet_count       = 3
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| subnet_count | The number of subnets to create gateways in, must match length of subnet_ids | string | - | yes |
| subnet_ids | A list of subnets to create gateways in | list | - | yes |
| tags | A map of tags to assign to resources | map | - | no |
| tags_for_resource | A nested map of tags to assign to specific resource types | map | - | no |

## Outputs

| Name | Description |
|------|-------------|
| nat_gateway_count | The number of gateways |
| nat_gateway_public_ips | The public EIPs of the Nat Gateways
| nat_gateway_ids | List of gateway IDs |
