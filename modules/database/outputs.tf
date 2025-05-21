output "sql_server_name" {
    description = "The name of the SQL Server"
    value       = azurerm_mssql_server.sql_server.name
}

output "sql_database_name" {
    description = "The name of the SQL Database"
    value       = azurerm_mssql_database.sql_database.name
}