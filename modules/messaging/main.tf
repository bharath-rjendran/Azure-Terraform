# create an Azure Service Bus Namespace
resource "azurerm_servicebus_namespace" "sb" {
  name                = "sb-${var.environment}-003"
  resource_group_name = var.resource_group_name
  location            = var.msg_location
  sku                 = "Standard"
}

# create an Azure Service Bus Queue
resource "azurerm_servicebus_queue" "queue" {
  name                = "queue-${var.environment}"
  namespace_id        = azurerm_servicebus_namespace.sb.id
  dead_lettering_on_message_expiration = true
  max_size_in_megabytes = 1024
}

# create an azure event grid topic
resource "azurerm_eventgrid_topic" "topic" {
  name                = "topic-${var.environment}-003"
  resource_group_name = var.resource_group_name
  location            = var.msg_location
  tags = {
    environment = var.environment
  }
}

# create an azure event hub namespace
resource "azurerm_eventhub_namespace" "eh" {
  name                = "eh-${var.environment}-003"
  resource_group_name = var.resource_group_name
  location            = var.msg_location
  sku                 = "Standard"
}

# create an azure event hub
resource "azurerm_eventhub" "eh" {
  name                = "eh-${var.environment}"
  namespace_id        = azurerm_eventhub_namespace.eh.id
  partition_count     = 2
  message_retention = 1
}

