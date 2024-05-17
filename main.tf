locals {
  context_name = var.rbac_type == "service" || var.rbac_type == "sandbox" ? var.service_name : "global"

  rbac_templates = {
    service  = local.service_app_templates
    sandbox  = local.sandbox_templates
    platform = local.platform_templates
  }

  flattened_role_assignments = var.rbac_type == "service" || var.rbac_type == "sandbox" ? merge(flatten([
    # iterate over the service groups
    for group_key, group in local.rbac_templates[var.rbac_type][var.template_name] : [
      for environment_key, environment in group.environments : [
        for role_key, role in environment : {
          "${group_key}-${role_key}-${environment_key}" = {
            scope                = var.scope_map[environment_key]
            scope_type           = "subscription"
            role_definition_name = role.role_definition_name
            pim_profile_name     = try(role.pim_profile_name, null)
            principal_id         = var.create_groups == true ? azuread_group.groups[group_key].object_id : data.azuread_group.groups[group_key].object_id
            group_name           = var.create_groups == true ? azuread_group.groups[group_key].display_name : data.azuread_group.groups[group_key].display_name
            context              = environment_key
            custom_role          = try(role.custom_role, false)
          }
        }
      ] if contains(keys(var.scope_map), environment_key)
    ]
    ])...) : merge(flatten([
    # iterate over the platform groups
    for group_key, group in local.platform_templates[var.template_name] : [
      for mg_key, mg in group.management_groups : [
        for role_key, role in mg : {
          "${group_key}-${role_key}-${mg_key}" = {
            scope                = "/providers/Microsoft.Management/managementGroups/${mg_key}"
            scope_type           = "management_group"
            role_definition_name = role.role_definition_name
            pim_profile_name     = try(role.pim_profile_name, null)
            principal_id         = var.create_groups == true ? azuread_group.groups[group_key].object_id : data.azuread_group.groups[group_key].object_id
            group_name           = var.create_groups == true ? azuread_group.groups[group_key].display_name : data.azuread_group.groups[group_key].display_name
            context              = mg_key
            custom_role          = try(role.custom_role, false)
          }
        }
      ]
    ]
  ])...)

  flattened_roles = toset([for k, v in local.flattened_role_assignments : v.role_definition_name])

  flattened_nested_groups = merge([
    for group_key, nested_groups in var.nested_groups_map : {
      for nested_group in nested_groups : "${group_key}_${nested_group}" => {
        group_key                 = group_key
        nested_group_display_name = nested_group
      }
    }
  ]...)
  all_nested_group_names = toset([for k, v in local.flattened_nested_groups : v.nested_group_display_name])
}

resource "azuread_group" "groups" {
  for_each = var.create_groups == true ? local.rbac_templates[var.rbac_type][var.template_name] : {}

  display_name     = "alz-${local.context_name}-${each.key}"
  owners           = [data.azurerm_client_config.current.object_id]
  mail_enabled     = false
  security_enabled = true
}

data "azuread_group" "groups" {
  for_each = var.create_groups == true ? {} : local.rbac_templates[var.rbac_type][var.template_name]

  display_name = "alz-${local.context_name}-${each.key}"
}

data "azuread_group" "nested_groups" {
  for_each = var.create_groups == true ? local.all_nested_group_names : []

  display_name = each.value
}

resource "azuread_group_member" "members" {
  for_each         = var.create_groups == true ? local.flattened_nested_groups : {}
  group_object_id  = azuread_group.groups[each.value.group_key].object_id
  member_object_id = data.azuread_group.nested_groups[each.value.nested_group_display_name].object_id
}

# update the settings for the policy
module "role_assignment" {
  for_each = local.flattened_role_assignments
  source   = "./modules/role_assignment"
  providers = {
    azurerm = azurerm
    time    = time
  }

  pim_enabled                  = each.value.pim_profile_name != null
  scope                        = each.value.scope
  scope_type                   = each.value.scope_type
  role_definition_id           = data.azurerm_role_definition.roles[each.value.role_definition_name].id
  role_definition_name         = each.value.role_definition_name
  group_name                   = each.value.group_name
  principal_id                 = each.value.principal_id
  custom_role                  = lookup(each.value, "custom_role", false)
  eligibility_rotation         = var.role_eligibility_rotation
  eligibility_rfc3339_duration = var.role_eligibility_rfc3339_duration
}

locals {
  existing_groups = { for k, v in data.azuread_group.groups : k => {
    object_id    = v.object_id
    display_name = v.display_name
  } }
  created_groups = { for k, v in azuread_group.groups : k => {
    object_id    = v.object_id
    display_name = v.display_name
  } }
}

# update the settings for the policy
module "pim_settings" {
  for_each = { for k, v in local.flattened_role_assignments : k => v if v.pim_profile_name != null }
  source   = "./modules/pim_settings"
  providers = {
    azapi = azapi
  }

  scope              = each.value.scope
  scope_type         = each.value.scope_type
  role_definition_id = data.azurerm_role_definition.roles[each.value.role_definition_name].id
  pim_settings       = local.pim_profile_templates[each.value.pim_profile_name]
  groups             = var.create_groups == true ? local.created_groups : local.existing_groups
}
