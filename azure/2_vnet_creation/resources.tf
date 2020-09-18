resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "TechlandersVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = "techlanders-rg"
    tags = {
        environment = "Terraform Demo"
    }
}
resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "mySubnet"
    resource_group_name  = "techlanders-rg"
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes       = ["10.0.2.0/24"]
}
