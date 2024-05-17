variable "pim_enabled" {
  type        = bool
  description = "Whether to enable PIM for the role assignment."
  default     = false
}

variable "scope" {
  type        = string
  description = "The scope of the role assignment."
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
  description = "The ID of the role definition."
}

variable "role_definition_name" {
  type        = string
  description = "The name of the role definition."
}

variable "principal_id" {
  type        = string
  description = "The principal ID of the role assignment."
}

variable "group_name" {
  type        = string
  description = "The name of the group."
}

variable "location" {
  type        = string
  description = "The location of the role assignment."
  default     = "uksouth"
}

variable "custom_role" {
  type        = bool
  description = "Whether the role is a custom role."
  default     = false
}

variable "eligibility_rotation" {
  type = object({
    years   = number
    months  = number
    days    = number
    hours   = number
    minutes = number
  })
  description = "The rotation of the eligibility duration."
  default = {
    years   = null
    months  = 6
    days    = null
    hours   = null
    minutes = null
  }
}

variable "eligibility_rfc3339_duration" {
  type        = string
  description = "The RFC3339 duration of the eligibility."
  default     = "P12M"
}
