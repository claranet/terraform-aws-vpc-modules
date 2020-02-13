# terraform-aws-vpc-modules subnets

Creates subnets in a VPC.

This module takes a single CIDR block and calculates the CIDR blocks to use for the subnets being created.

## Usage

This is a lower level module. Consider using the [private-subnets](../private-subnets) or [public-subnets](../public-subnets) modules instead.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability_zones | A list of availability zones to create the subnets in | list | - | yes |
| cidr_block | The larger CIDR block to use for calculating individual subnet CIDR blocks | string | - | yes |
| map_public_ip_on_launch | Assign a public IP address to instances launched into these subnets | string | `false` | no |
| propagating_vgws | A list of virtual gateways for route propagation | list | - | no |
| subnet_count | The number of subnets to create | string | - | yes |
| tags | A map of tags to assign to resources | map | - | no |
| tags_for_resource | A nested map of tags to assign to specific resource types | map | - | no |
| vpc_id | The ID of the VPC to create the subnets in | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| route_table_ids | List of route table IDs |
| subnet_count | The number of subnets |
| subnet_ids | List of subnet IDs |
