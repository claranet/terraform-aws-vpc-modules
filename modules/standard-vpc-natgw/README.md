# terraform-aws-vpc-modules standard-vpc-natgw

Creates a VPC with public and private subnets and NAT Gateways.

This module takes CIDR blocks for public and private subnets, and the number of subnets to create within the CIDR blocks, and calculates the CIDR blocks to use for the subnets being created.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability_zones | A list of availability zones to create subnets in | list | - | yes |
| domain_name | The suffix domain to use by default when resolving non Full Qualified Domain Names, if left blank then <region>.compute.internal will be used | string | `` | no |
| domain_name_servers | List of name servers to configure in /etc/resolve.conf, defaults to the default AWS nameservers | list | `<list>` | no |
| enable_dns_hostnames | Enable DNS hostnames in the VPC | string | `false` | no |
| enable_dns_support | Enable DNS support in the VPC | string | `true` | no |
| map_public_ip_on_launch | Assign a public IP address to instances launched into the public subnets | string | `false` | no |
| private_cidr_block | The larger CIDR block to use for calculating individual private subnet CIDR blocks | string | - | yes |
| private_propagating_vgws | A list of virtual gateways for route propagation in the private subnets | list | `<list>` | no |
| private_subnet_count | The number of private subnets to create | string | - | yes |
| public_cidr_block | The larger CIDR block to use for calculating individual public subnet CIDR blocks | string | - | yes |
| public_propagating_vgws | A list of virtual gateways for route propagation in the public subnets | list | `<list>` | no |
| public_subnet_count | The number of public subnets to create | string | - | yes |
| tags | A map of tags to assign to resources | map | `<map>` | no |
| vpc_cidr_block | The CIDR block for the VPC | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| internet_gateway_id | The Internet Gateway ID |
| private_route_table_ids | List of private route table IDs |
| private_subnet_count | The number of private subnets |
| private_subnet_ids | List of private subnet IDs |
| public_route_table_ids | List of public route table IDs |
| public_subnet_count | The number of public subnets |
| public_subnet_ids | List of public subnet IDs |
| vpc_id | The VPC ID |
