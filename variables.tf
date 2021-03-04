# Generic variables

variable "availability_zones" {
  description = "A list of availability zones to create subnets in"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "tags_for_resource" {
  description = "A nested map of tags to assign to specific resource types"
  type        = map(map(string))
  default     = {}
}

# VPC variables

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "enable_dhcp_options" {
  description = "Enable creation of DHCP Options"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = string
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = string
  default     = false
}

variable "domain_name" {
  description = "The suffix domain to use by default when resolving non Full Qualified Domain Names, if left blank then <region>.compute.internal will be used"
  default     = ""
}

variable "domain_name_servers" {
  description = "List of name servers to configure in /etc/resolve.conf, defaults to the default AWS nameservers"
  type        = list(string)

  default = [
    "AmazonProvidedDNS",
  ]
}

# Public subnet variables

variable "public_cidr_block" {
  description = "The larger CIDR block to use for calculating individual public subnet CIDR blocks"
  type        = string
}

variable "public_subnet_count" {
  description = "The number of public subnets to create"
  type        = string
}

variable "public_propagating_vgws" {
  description = "A list of virtual gateways for route propagation in the public subnets"
  type        = list(string)
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "Assign a public IP address to instances launched into the public subnets"
  type        = string
  default     = false
}

# Private subnet variables

variable "private_cidr_block" {
  description = "The larger CIDR block to use for calculating individual private subnet CIDR blocks"
  type        = string
}

variable "private_subnet_count" {
  description = "The number of private subnets to create"
  type        = string
}

variable "private_propagating_vgws" {
  description = "A list of virtual gateways for route propagation in the private subnets"
  type        = list(string)
  default     = []
}
