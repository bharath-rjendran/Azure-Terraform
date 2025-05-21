# Create an Azure SQL Server
resource "azurerm_mssql_server" "sql_server" {
  name                         = "sqlserver-01-${var.environment}"
  resource_group_name          = var.resource_group_name
  location                     = var.db_location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  tags = {
    environment = var.environment
  }
}

# Create an Azure SQL Database
resource "azurerm_mssql_database" "sql_database" {
  name                = "sqldatabase-01-${var.environment}"
  server_id           = azurerm_mssql_server.sql_server.id
  sku_name            = "Basic"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb         = 1
  tags = {
    environment = var.environment
  }
}