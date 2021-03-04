# terraform-aws-vpc-modules

This is a collection of Terraform modules for AWS VPC management.

By default it creates a traditional public/private subnet structure and NAT Gateways, which should be suitable for many projects.

However, it also includes [submodules](./modules/) to help with creating any kind of VPC and subnet design. These [submodules](./modules/) were designed to be composable and flexible and have their own documentation.

## Terraform version compatibility

| Module version | Terraform version |
|----------------|-------------------|
| 1.x.x          | 0.12.x            |
| 0.x.x          | 0.11.x            |

## Usage

This creates a VPC with public and private subnets and NAT Gateways.

This module takes CIDR blocks for public and private subnets, and the number of subnets to create within the CIDR blocks, and calculates the CIDR blocks to use for the subnets being created.

```hcl
module "vpc" {
  source  = "claranet/vpc-modules/aws"
  version = "0.4.0"

  enable_dns_support   = true
  enable_dns_hostnames = true

  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  vpc_cidr_block = "10.112.0.0/16"

  public_cidr_block   = "10.112.0.0/20"
  public_subnet_count = 3

  private_cidr_block   = "10.112.16.0/20"
  private_subnet_count = 3

  # Tags for all resources that support them.
  tags = {
    Name = "my-vpc"
  }

  # Override tags for specific resource types.
  tags_for_resource = {
    aws_vpc = {
      "Name"                             = "my-vpc"
      "kubernetes.io/cluster/my-cluster" = "shared"
    }
    aws_subnet = {
      "Name"                             = "my-vpc"
      "kubernetes.io/cluster/my-cluster" = "shared"
    }
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability_zones | A list of availability zones to create subnets in | list | - | yes |
| domain_name | The suffix domain to use by default when resolving non Full Qualified Domain Names, if left blank then <region>.compute.internal will be used | string | - | no |
| domain_name_servers | List of name servers to configure in /etc/resolve.conf, defaults to the default AWS nameservers | list | `AmazonProvidedDNS` | no |
| enable_dhcp_options | Enable creation of DHCP Options | string | `true` | no |
| enable_dns_hostnames | Enable DNS hostnames in the VPC | string | `false` | no |
| enable_dns_support | Enable DNS support in the VPC | string | `true` | no |
| map_public_ip_on_launch | Assign a public IP address to instances launched into the public subnets | string | `false` | no |
| private_cidr_block | The larger CIDR block to use for calculating individual private subnet CIDR blocks | string | - | yes |
| private_propagating_vgws | A list of virtual gateways for route propagation in the private subnets | list | - | no |
| private_subnet_count | The number of private subnets to create | string | - | yes |
| public_cidr_block | The larger CIDR block to use for calculating individual public subnet CIDR blocks | string | - | yes |
| public_propagating_vgws | A list of virtual gateways for route propagation in the public subnets | list | - | no |
| public_subnet_count | The number of public subnets to create | string | - | yes |
| tags | A map of tags to assign to resources | map | - | no |
| tags_for_resource | A nested map of tags to assign to specific resource types | map | - | no |
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
