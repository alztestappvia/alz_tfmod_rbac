locals {
  pim_profile_templates = {
    manager_approval = {
      requires_approval                = true
      approval_group_keys              = ["managers"]
      max_assignment_duration_in_hours = 10
    }

    self_approval = {
      requires_approval                = false
      max_assignment_duration_in_hours = 12
    }
  }
}
