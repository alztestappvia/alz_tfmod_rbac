locals {
  # details of request content can be found here: https://learn.microsoft.com/en-us/rest/api/authorization/role-management-policies/update
  role_definition_id = "${var.scope_type == "subscription" ? var.scope : ""}${var.role_definition_id}"
  pim_settings = jsonencode({
    properties = {
      rules = [
        {
          isExpirationRequired = false
          maximumDuration      = "P365D"
          id                   = "Expiration_Admin_Eligibility"
          ruleType             = "RoleManagementPolicyExpirationRule"
          target = {
            caller     = "Admin"
            operations = ["All"]
            level      = "Eligibility"
          }
        },
        {
          setting = {
            isApprovalRequired               = var.pim_settings.requires_approval
            isApprovalRequiredForExtension   = false
            isRequestorJustificationRequired = true
            approvalMode                     = "SingleStage"
            approvalStages = [
              {
                approvalStageTimeOutInDays      = 1
                isApproverJustificationRequired = true
                escalationTimeInMinutes         = 0
                primaryApprovers = [for group_key in matchkeys(keys(var.groups), keys(var.groups), var.pim_settings.approval_group_keys) :
                  {
                    id          = var.groups[group_key].object_id
                    description = var.groups[group_key].display_name
                    isBackup    = false
                    userType    = "Group"
                  }
                ]
                isEscalationEnabled = false
              }
            ]
          }
          id       = "Approval_EndUser_Assignment"
          ruleType = "RoleManagementPolicyApprovalRule"
          target = {
            caller     = "EndUser"
            operations = ["All"]
            level      = "Assignment"
          }
        },
        {
          isExpirationRequired = true
          maximumDuration      = "PT${var.pim_settings.max_assignment_duration_in_hours}H"
          id                   = "Expiration_EndUser_Assignment"
          ruleType             = "RoleManagementPolicyExpirationRule"
          target = {
            caller              = "EndUser"
            operations          = ["All"]
            level               = "Assignment"
            targetObjects       = null
            inheritableSettings = null
            enforcedSettings    = null
          }
        }
      ]
    }
  })
}

data "azapi_resource" "pim_roles" {
  type                   = "Microsoft.Authorization/roleManagementPolicies@2020-10-01"
  name                   = format("?$filter=roleDefinitionId eq '%s'", local.role_definition_id)
  parent_id              = var.scope
  response_export_values = ["*"]
}

resource "azapi_resource_action" "pim_settings" {
  type        = "Microsoft.Authorization/roleManagementPolicies@2020-10-01"
  resource_id = jsondecode(data.azapi_resource.pim_roles.output).value.0.id
  method      = "PATCH"

  body = local.pim_settings
}
