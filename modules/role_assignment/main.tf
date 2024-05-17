locals {
  role_definition_id = "${var.scope_type == "subscription" ? var.scope : ""}${var.role_definition_id}"
}

resource "azurerm_role_assignment" "role_assignment" {
  count                            = var.pim_enabled == true ? 0 : 1
  scope                            = var.scope
  role_definition_id               = var.custom_role == true ? local.role_definition_id : null
  role_definition_name             = var.custom_role == false ? var.role_definition_name : null
  principal_id                     = var.principal_id
  skip_service_principal_aad_check = false
}

resource "time_rotating" "eligible_schedule_request_start_date" {
  count            = var.pim_enabled == true ? 1 : 0
  rotation_years   = var.eligibility_rotation.years
  rotation_months  = var.eligibility_rotation.months
  rotation_days    = var.eligibility_rotation.days
  rotation_hours   = var.eligibility_rotation.hours
  rotation_minutes = var.eligibility_rotation.minutes
}

// Generate a new guid for the eligible schedule request whenever principal_id, role_definition_id changes
resource "random_uuid" "eligible_schedule_request_id" {
  count = var.pim_enabled == true ? 1 : 0
  keepers = {
    principal_id       = var.principal_id
    role_definition_id = local.role_definition_id
    start_date         = local.start_date
  }
}

locals {
  start_date = var.pim_enabled == true ? "${formatdate("YYYY-MM-DD", time_rotating.eligible_schedule_request_start_date[0].id)}T${formatdate("HH:mm:ss.0000000+02:00", time_rotating.eligible_schedule_request_start_date[0].id)}" : ""
}

resource "azapi_resource_action" "pim_assignment" {
  count = var.pim_enabled == true ? 1 : 0

  type        = "Microsoft.Authorization/roleEligibilityScheduleRequests@2022-04-01-preview"
  resource_id = "${var.scope}/providers/Microsoft.Authorization/roleEligibilityScheduleRequests/${random_uuid.eligible_schedule_request_id[0].result}"
  method      = "PUT"

  body = jsonencode({
    properties = {
      principalId      = var.principal_id
      requestType      = "AdminUpdate"
      roleDefinitionId = local.role_definition_id
      startDateTime    = local.start_date
      scheduleInfo = {
        expiration = {
          type     = "AfterDuration"
          duration = var.eligibility_rfc3339_duration
        }
      }
    }
  })
}

# FIXME This is horrible, should not be using az cli, but due to the API constraints, this is required
resource "null_resource" "pim_assignment_deletion" {
  count = var.pim_enabled == true ? 1 : 0

  triggers = {
    scope = var.scope
    pim_remove_json = jsonencode({
      properties = {
        requestType      = "AdminRemove"
        roleDefinitionId = local.role_definition_id
        principalId      = var.principal_id
      }
    })
  }

  # NOTE: This will not destroy if this resource is or a parent module is removed from configuration (https://github.com/hashicorp/terraform/issues/13549)
  # However, the current implementation uses for_each on the module definitions so it will be removed for normal usage.  This will only be an issue if doing
  # major refactoring.
  provisioner "local-exec" {
    when    = destroy
    command = "az rest --method PUT --url https://management.azure.com${self.triggers.scope}/providers/Microsoft.Authorization/roleEligibilityScheduleRequests/${uuid()}?api-version=2022-04-01-preview --body '${self.triggers.pim_remove_json}'"
  }
}
