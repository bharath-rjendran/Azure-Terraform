resource "azurerm_storage_account" "storage" {
    name                     = "stgaccountbr${var.environment}"
    resource_group_name      = var.resource_group_name
    location                 = var.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
        environment = var.environment
    }
}

resource "azurerm_storage_container" "name" {
    name                  = "container-${var.environment}"
    storage_account_id    = azurerm_storage_account.storage.id
    container_access_type = "private"
}

resource "azurerm_storage_share" "share" {
    name                 = "share-${var.environment}"
    storage_account_id   = azurerm_storage_account.storage.id
    quota                = 50
}