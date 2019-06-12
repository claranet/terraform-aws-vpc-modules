provider "aws" {
  region = "eu-west-1"
}

resource "random_id" "name" {
  byte_length = 4
  prefix      = "terraform-aws-vpc-modules-"
}

module "vpc" {
  source = "../.."

  enable_dns_support   = true
  enable_dns_hostnames = true

  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  vpc_cidr_block = "10.112.0.0/16"

  public_cidr_block   = "10.112.0.0/20"
  public_subnet_count = 3

  private_cidr_block   = "10.112.16.0/20"
  private_subnet_count = 3

  tags = {
    Name = random_id.name.hex
  }
}
