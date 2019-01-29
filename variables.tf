variable "resource_group" {
  type = "string"
}

variable "environment" {
  type = "string"
}

variable "name_suffix" {
  type = "string"
}

variable "vnet_name" {
  type = "string"
}

variable "subnet_name" {
  type = "string"
}

variable "route_table_name" {
  type = "string"
}

variable "disable_bgp_route_propagation" {
  type    = "string"
  default = "true"
}

variable "route_names" {
  type    = "list"
  default = ["subnet1"]
}

variable "route_prefixes" {
  type    = "list"
  default = ["10.0.1.0/24"]
}

variable route_nexthop_types {
  type    = "list"
  default = ["VnetLocal"]
}

variable next_hop_in_ip_address {
  type    = "list"
  default = []
}
