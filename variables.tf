# File for variable definition

variable "vnet_name" {
  description = "Name of the vnet to create"
  default = "myvnet"
}

variable "resource_group_name" {
  description = "Resource group name that the network will be created in."
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default = "10.0.0.0/16"
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type = "list"
  default = []
}

variable "subnets" {
  description = "Map of subnets and prefixes"
  type = "map"
  default = {
    "default" = "10.0.1.0/24"
  }
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type = "map"

  default = {
    tag1 = ""
    tag2 = ""
  }
  
}