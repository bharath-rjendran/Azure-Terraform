provider "azurerm" {
  subscription_id = "67d51d48-5149-4869-8723-1725d5afded4"
  client_id       = "444b7263-88fc-49a5-b681-d9a5c7e65816"
  tenant_id       = "382589be-c5d1-4f38-98a4-67875a9d66e9"
  client_secret   = "mm48Q~g~2vzvceeyrFwY~bqnNPNbvGFDpE92vc2i"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
