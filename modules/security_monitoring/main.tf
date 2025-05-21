#create an Azure Key Vault
resource "azurerm_key_vault" "kv" {
  name                = "${var.environment}-kvault-003"
  location            = var.sm_location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
  tags = {
    environment = var.environment
  }
}

# Create an Azure Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "law" {
  name                = "${var.environment}-law"
  location            = var.sm_location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    environment = var.environment
  }
}

# Create an Azure Application Insights
resource "azurerm_application_insights" "ai" {
  name                = "${var.environment}-ai"
  location            = var.sm_location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  tags = {
    environment = var.environment
  }
}