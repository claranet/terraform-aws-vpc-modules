# terraform-aws-vpc-modules vpc

Creates a VPC, Internet Gateway, and DHCP options.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cidr_block | The CIDR block for the VPC | string | - | yes |
| domain_name | The suffix domain to use by default when resolving non Full Qualified Domain Names, if left blank then <region>.compute.internal will be used | string | `` | no |
| domain_name_servers | List of name servers to configure in /etc/resolve.conf, defaults to the default AWS nameservers | list | `<list>` | no |
| enable_dns_hostnames | Enable DNS hostnames in the VPC | string | `false` | no |
| enable_dns_support | Enable DNS support in the VPC | string | `true` | no |
| tags | A map of tags to assign to resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| internet_gateway_id | The Internet Gateway ID |
| vpc_id | The VPC ID |
