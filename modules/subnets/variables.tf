# Standard subnet variables

variable "vpc_id" {
  description = "The ID of the VPC to create the subnets in"
  type        = string
}

variable "cidr_block" {
  description = "The larger CIDR block to use for calculating individual subnet CIDR blocks"
  type        = string
}

variable "subnet_count" {
  description = "The number of subnets to create"
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones to create the subnets in"
  type        = list(string)
}

variable "propagating_vgws" {
  description = "A list of virtual gateways for route propagation"
  type        = list(string)
  default     = []
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

# Public subnet variables

variable "map_public_ip_on_launch" {
  description = "Assign a public IP address to instances launched into these subnets"
  type        = string
  default     = false
}
