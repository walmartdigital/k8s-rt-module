variable "resource_group" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "disable_bgp_route_propagation" {
  type    = string
  default = "true"
}

variable "route_names" {
  type    = list(string)
  default = []
}

variable "route_prefixes" {
  type    = list(string)
  default = []
}

variable "route_nexthop_types" {
  type    = list(string)
  default = []
}

variable "next_hop_in_ip_address" {
  type    = list(string)
  default = []
}
