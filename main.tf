terraform {
  required_version = ">= 0.12"
}

data "azurerm_resource_group" "main" {
  name = var.resource_group
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = data.azurerm_resource_group.main.name
}

resource "azurerm_route_table" "route_table" {
  name                          = var.route_table_name
  location                      = data.azurerm_resource_group.main.location
  resource_group_name           = data.azurerm_resource_group.main.name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
}

resource "azurerm_subnet_route_table_association" "route_table_association" {
  subnet_id      = data.azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.route_table.id
}

resource "azurerm_route" "route" {
  count                  = length(var.route_names)
  name                   = var.route_names[count.index]
  resource_group_name    = data.azurerm_resource_group.main.name
  route_table_name       = azurerm_route_table.route_table.name
  address_prefix         = var.route_prefixes[count.index]
  next_hop_type          = var.route_nexthop_types[count.index]
  next_hop_in_ip_address = var.route_nexthop_types[count.index] == "VirtualAppliance" ? var.next_hop_in_ip_address[count.index] : ""
}
