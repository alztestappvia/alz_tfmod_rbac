locals {
  platform_templates = {
    standard = {
      platform_engineers = {
        management_groups = {
          alz = {
            owner = {
              role_definition_name = "Owner"
              pim_profile_name     = "self_approval"
            }
            contributor = {
              role_definition_name = "Contributor"
              pim_profile_name     = "self_approval"
            }
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_reader = {
              role_definition_name = "Monitoring Reader"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
            resource_policy_contributor = {
              role_definition_name = "Resource Policy Contributor"
              pim_profile_name     = "self_approval"
            }
          }
          "alz-platform" = {
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
          }
        }
      }
      security_engineers = {
        management_groups = {
          alz = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_reader = {
              role_definition_name = "Monitoring Reader"
            }
            security_admin = {
              role_definition_name = "Security Admin"
            }
            resource_policy_contributor = {
              role_definition_name = "Resource Policy Contributor"
              pim_profile_name     = "self_approval"
            }
          }
          "alz-management" = {
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
          }
        }
      }
      network_engineers = {
        management_groups = {
          alz = {
            reader = {
              role_definition_name = "Reader"
            }
            network_contributor = {
              role_definition_name = "Network Contributor"
              pim_profile_name     = "self_approval"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_reader = {
              role_definition_name = "Monitoring Reader"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          "alz-connectivity" = {
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
          }
        }
      }
    }

    basic = {
      platform_engineers = {
        management_groups = {
          alz = {
            owner = {
              role_definition_name = "Owner"
            }
          }
        }
      }
    }
  }
}
