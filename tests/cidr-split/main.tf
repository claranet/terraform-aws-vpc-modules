provider "aws" {
  region = "eu-west-1"
}

resource "random_id" "name" {
  byte_length = 4
  prefix      = "terraform-aws-vpc-modules-"
}

module "vpc" {
  source = "../../modules/vpc"

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = random_id.name.hex
  }
}

# One subnet should take the whole CIDR block:

module "subnets1" {
  source = "../../modules/private-subnets"

  vpc_id = module.vpc.vpc_id

  cidr_block         = "10.0.0.0/20"
  subnet_count       = 1
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  tags = {
    Name = random_id.name.hex
  }
}

# Two subnets should split the CIDR block in half.

module "subnets2" {
  source = "../../modules/private-subnets"

  vpc_id = module.vpc.vpc_id

  cidr_block         = "10.0.16.0/20"
  subnet_count       = 2
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  tags = {
    Name = random_id.name.hex
  }
}

# Three subnets should split the CIDR block into quarters
# but then only use 3 of them.

module "subnets3" {
  source = "../../modules/private-subnets"

  vpc_id = module.vpc.vpc_id

  cidr_block         = "10.0.32.0/20"
  subnet_count       = 3
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  tags = {
    Name = random_id.name.hex
  }
}

# Four subnets should split the CIDR block into quarters and use all of them,
# but with only 3 availability zones there will be 2 subnets in 1 of the zones.

module "subnets4" {
  source = "../../modules/private-subnets"

  vpc_id = module.vpc.vpc_id

  cidr_block         = "10.0.48.0/20"
  subnet_count       = 4
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  tags = {
    Name = random_id.name.hex
  }
}
