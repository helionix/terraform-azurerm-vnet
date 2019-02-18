resource "azurerm_resource_group" "rg" {
  location = "EastUS"
  name = "my-rg"
}

module "vnet" {
  source = "github.com/helionix/terraform-azurerm-vnet"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space = "10.0.0.0/16"
  subnets = {
    "default" = "10.0.1.0/24"
  }

  tags = {
    environment = "myenv"
  }
}