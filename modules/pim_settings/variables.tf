variable "scope" {
  type        = string
  description = "The scope of the pim settings."
}

variable "scope_type" {
  type        = string
  description = "The scope type of the role assignment."
  validation {
    condition     = contains(["subscription", "management_group"], var.scope_type)
    error_message = "The scope type must be either 'subscription' or 'management_group'."
  }
}

variable "role_definition_id" {
  type        = string
  description = "The ID of the role definition for the scope of the pim settings."
}

variable "pim_settings" {
  type = object({
    requires_approval                = optional(bool, false)
    approval_group_keys              = optional(list(string), [])
    max_assignment_duration_in_hours = optional(number, 8)
  })
  description = "The pim settings."
}

variable "groups" {
  type = map(object({
    object_id    = string
    display_name = string
  }))
  description = "The groups to use for the pim settings."
}
