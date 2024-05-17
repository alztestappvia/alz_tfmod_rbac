data "azurerm_client_config" "current" {}

data "azurerm_role_definition" "roles" {
  for_each = local.flattened_roles
  name     = each.value
  scope    = "/providers/Microsoft.Management/managementGroups/${var.root_id}"
}
