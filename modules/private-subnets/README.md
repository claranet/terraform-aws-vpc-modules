# terraform-aws-vpc-modules private-subnets

Creates private subnets and route tables in a VPC, optionally using NAT Gateways for internet access.

This module takes a single CIDR block and calculates the CIDR blocks to use for the subnets being created.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability_zones | A list of availability zones to create the subnets in | list | - | yes |
| cidr_block | The larger CIDR block to use for calculating individual subnet CIDR blocks | string | - | yes |
| nat_gateway_count | The number of NAT gateways to use for routing, must match subnet_count and nat_gateway_ids | string | `0` | no |
| nat_gateway_ids | A list of NAT Gateway IDs to use for routing | string | `<list>` | no |
| propagating_vgws | A list of virtual gateways for route propagation | list | `<list>` | no |
| subnet_count | The number of subnets to create | string | - | yes |
| tags | A map of tags to assign to resources | map | `<map>` | no |
| vpc_id | The ID of the VPC to create the subnets in | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| route_table_ids | List of route table IDs |
| subnet_count | The number of subnets |
| subnet_ids | List of subnet IDs |
