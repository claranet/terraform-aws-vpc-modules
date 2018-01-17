# terraform-aws-vpc-modules

This is a collection of Terraform modules for AWS VPC management.

It includes a [standard-vpc-natgw](./modules/standard-vpc-natgw) module with a traditional public/private subnet structure and NAT Gateways, which should be suitable for many projects. It also includes smaller modules to help with creating less traditional VPCs. The [standard-vpc-natgw](./modules/standard-vpc-natgw) module shows how the smaller modules can be used together to set up a VPC.

The individual [modules](./modules/) have their own documentation.
