data "azurerm_resource_group" "main" {
  name = "${var.resource_group}"
}

resource "azurerm_route_table" "route_table" {
  name                          = "${var.route_table_name}-${var.cluster_name}-${var.environment}-${var.name_suffix}"
  location                      = "${data.azurerm_resource_group.main.location}"
  resource_group_name           = "${data.azurerm_resource_group.main.name}"
  disable_bgp_route_propagation = "${var.disable_bgp_route_propagation}"
}

resource "azurerm_route" "route" {
  count                  = "${length(var.route_names)}"
  name                   = "${var.route_names[count.index]}"
  resource_group_name    = "${data.azurerm_resource_group.main.name}"
  route_table_name       = "${azurerm_route_table.route_table.name}"
  address_prefix         = "${var.route_prefixes[count.index]}"
  next_hop_type          = "${var.route_nexthop_types[count.index]}"
  next_hop_in_ip_address = "${var.route_nexthop_types[count.index] == "VirtualAppliance" ? var.next_hop_in_ip_address[count.index] : ""}"
}
