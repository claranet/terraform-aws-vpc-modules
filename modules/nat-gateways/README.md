# terraform-aws-vpc-modules nat-gateways

Creates an AWS NAT Gateway in each provided subnet.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| subnet_count | The number of subnets to create gateways in, must match length of subnet_ids | string | - | yes |
| subnet_ids | A list of subnets to create gateways in | list | - | yes |
| tags | A map of tags to assign to resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| nat_gateway_count | The number of gateways |
| nat_gateway_ids | List of gateway IDs |
