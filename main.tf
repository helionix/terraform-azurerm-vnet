# Main terraform file for resources

data "azurerm_resource_group" "vnet-rg" {
  name = "${var.resource_group_name}"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  location            = "${data.azurerm_resource_group.vnet-rg.location}"
  address_space       = ["${var.address_space}"]
  resource_group_name = "${data.azurerm_resource_group.vnet-rg.name}"
  dns_servers         = "${var.dns_servers}"
  tags                = "${var.tags}"
}

resource "azurerm_subnet" "subnet" {
  name                 = "${element(keys(var.subnets), count.index)}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${data.azurerm_resource_group.vnet-rg.name}"
  address_prefix       = "${element(values(var.subnets), count.index)}"
  count                = "${length(keys(var.subnets))}"
}