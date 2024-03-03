resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_network_security_group" "nsg1" {
  name                = "aks-nsg"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

   security_rule {
    name                       = "kube-apiserver-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = var.source_pref
    destination_address_prefix = "*"
  }
   security_rule {
    name                       = "ssh-rule"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.source_pref
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "vn1" {
  name                = "aks-vnet"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = var.vnet_address_space

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "cps" {
  name                 = "control-plane-subnet"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vn1.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "wns" {
  name                 = "worker-node-subnet"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vn1.name
  address_prefixes     = ["10.0.2.0/24"]
}
