# terraform-azurerm-vnet

## Create a virtual network in Azure

This terraform module creates virtual network with subnets in Azure

## Usage

```hcl
module "vnet" {
    source = "github.com/helionix/terraform-azurerm-vnet"
    resource_group_name = "my-rg"
    address_space = "10.0.0.0/16"
    subnets = {
      "default" = "10.0.1.0/24"
    }

    tags = {
      environment = "myenv"
    }
}
```

## Inputs

| Name                  | Description                                              |  Type  |     Default     | Required |
|:----------------------|:---------------------------------------------------------|:------:|:---------------:|:--------:|
| address\_space        | The address space that is used by the virtual network.   | string | `"10.0.0.0/16"` |    no    |
| dns\_servers          | The DNS servers to be used with vNet.                    |  list  |    `<list>`     |    no    |
| resource\_group\_name | Resource group name that the network will be created in. | string |       n/a       |   yes    |
| subnets               | Map of subnets and prefixes                              |  map   |     `<map>`     |    no    |
| tags                  | The tags to associate with your network and subnets.     |  map   |     `<map>`     |    no    |
| vnet\_name            | Name of the vnet to create                               | string |   `"myvnet"`    |    no    |

## Outputs

| Name                 | Description                                      |
|:---------------------|:-------------------------------------------------|
| vnet\_address\_space | The address space of the newly created vNet      |
| vnet\_id             | The id of the newly created vNet                 |
| vnet\_location       | The location of the newly created vNet           |
| vnet\_name           | The Name of the newly created vNet               |
| vnet\_subnets_ids    | The ids of subnets created inside the new vNet   |
| vnet\_subnets_names  | The names of subnets created inside the new vNet |


## License

[MIT](LICENSE)
