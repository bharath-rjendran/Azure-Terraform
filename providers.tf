provider "azurerm" {
  subscription_id = "4f0063ab-721d-4e50-b826-0fdb9627022e"
  client_id       = "9066e710-7b1a-4e3c-b98c-15b0ad4ba857"
  tenant_id       = "da8b9507-37d5-409e-b393-f85799d68ad3"
  client_secret   = "dBt8Q~J3p_dG8Hck_gvBXycty5dVPbzTkUc1jaFm"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
