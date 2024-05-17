variable "root_id" {
  description = "The Tenant Root ID where resources are to be provisioned under"
  type        = string
  default     = "alz"
}

variable "rbac_type" {
  type        = string
  description = "The type of RBAC to create. Can be either 'platform', 'service' or 'sandbox'."
  default     = "service"
  validation {
    condition     = contains(["platform", "service", "sandbox"], var.rbac_type)
    error_message = "The RBAC type must be either 'platform', 'service' or 'sandbox'."
  }
}

variable "service_name" {
  type        = string
  description = "The name of the service to create RBAC for."
  default     = null
}

variable "template_name" {
  type        = string
  description = "The name of the template to use for the service."
  default     = "standard"
}

variable "scope_map" {
  type        = map(string)
  description = "A map of scopes to assign to the service. It should map each environment in the template to a scope. Required when creating service RBAC."
  default     = {}
}

variable "nested_groups_map" {
  type        = map(list(string))
  description = "A map of groups to assign to the service. It should map each group in the template to a list of member groups."
  default     = {}
}

variable "create_groups" {
  type        = bool
  description = "Whether to create the groups for the RBAC. Set to false if you want to use existing groups."
  default     = true
}

variable "role_eligibility_rotation" {
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

variable "role_eligibility_rfc3339_duration" {
  type        = string
  description = "The RFC3339 duration of the eligibility."
  default     = "P12M"
}
