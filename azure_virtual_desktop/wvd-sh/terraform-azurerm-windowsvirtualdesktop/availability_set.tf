resource "azurerm_resource_group" "wvd-rg" {
  name      = var.resource_group_name 
  location  = var.region
}

resource "azurerm_availability_set" "main" {
  name                         = var.host_pool_name
  location                     = var.region
  resource_group_name          = var.resource_group_name
  managed                      = "true"
  platform_update_domain_count = var.as_platform_update_domain_count
  platform_fault_domain_count  = var.as_platform_fault_domain_count
  depends_on                   = [azurerm_resource_group.wvd-rg]

  tags = {
    BUC             = var.tagBUC
    SupportGroup    = var.tagSupportGroup
    AppGroupEmail   = var.tagAppGroupEmail
    EnvironmentType = var.tagEnvironmentType
    CustomerCRMID   = var.tagCustomerCRMID
  }
}
