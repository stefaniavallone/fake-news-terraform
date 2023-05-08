data "azurerm_client_config" "current" {}
 
terraform {
    backend "local" {
    }
}

# Create Resource Group
resource "azurerm_resource_group" "fake_news_resource_group" {
  name     = var.fake_news_resource_group_name
  location = var.location
}

resource "azurerm_application_insights" "fake_news_insights" {
  name                = var.fake_news_insights_name
  location            = azurerm_resource_group.fake_news_resource_group.location
  resource_group_name = azurerm_resource_group.fake_news_resource_group.name
  application_type    = "web"
}

resource "azurerm_key_vault" "fake_news_key_vault" {
  name                = var.fake_news_key_vault_name
  location            = azurerm_resource_group.fake_news_resource_group.location
  resource_group_name = azurerm_resource_group.fake_news_resource_group.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"
}

resource "azurerm_storage_account" "fake_news_storage" {
  name                     = var.fake_news_storage_name
  location                 = azurerm_resource_group.fake_news_resource_group.location
  resource_group_name      = azurerm_resource_group.fake_news_resource_group.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_machine_learning_workspace" "fake_news_machine_learning" {
  name                          = var.fake_news_machine_learning_name
  location                      = azurerm_resource_group.fake_news_resource_group.location
  resource_group_name           = azurerm_resource_group.fake_news_resource_group.name
  application_insights_id       = azurerm_application_insights.fake_news_insights.id
  key_vault_id                  = azurerm_key_vault.fake_news_key_vault.id
  storage_account_id            = azurerm_storage_account.fake_news_storage.id
  public_network_access_enabled = true
  identity {
    type = "SystemAssigned"
  }
} 

resource "azurerm_virtual_network" "fake_news_network" {
  name                = var.fake_news_network_name
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.fake_news_resource_group.location
  resource_group_name = azurerm_resource_group.fake_news_resource_group.name
}

resource "azurerm_subnet" "fake_news_subnet" {
  name                 = var.fake_news_subnet_name
  resource_group_name  = azurerm_resource_group.fake_news_resource_group.name
  virtual_network_name = azurerm_virtual_network.fake_news_network.name
  address_prefixes     = ["10.1.0.0/24"]
}



resource "azurerm_machine_learning_compute_instance" "fake_news_machine_learning_compute_instance" {
  name                          = var.fake_news_machine_learning_compute_instance_name
  location                      = azurerm_resource_group.fake_news_resource_group.location
  machine_learning_workspace_id = azurerm_machine_learning_workspace.fake_news_machine_learning.id
  virtual_machine_size          = "STANDARD_DS2_V2"
  authorization_type            = "personal"
  ssh {
    public_key = var.ssh_key
  }
  subnet_resource_id = azurerm_subnet.fake_news_subnet.id
  description        = "foo"
  tags = {
    foo = "bar"
  }
}