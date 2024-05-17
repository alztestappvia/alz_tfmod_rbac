locals {
  service_app_templates = {
    standard = {
      engineers = {
        environments = {
          dev = {
            owner = {
              role_definition_name = "Owner"
              pim_profile_name     = "manager_approval"
            }
            application_owner = {
              role_definition_name = "[ALZ] Application-Owners"
              custom_role          = true
            }
            network_subnet_contributor = {
              role_definition_name = "[ALZ] Network-Subnet-Contributor"
              custom_role          = true
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          pre = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          prd = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
        }
      }

      external = {
        environments = {
          dev = {
            application_owner = {
              role_definition_name = "[ALZ] Application-Owners"
              custom_role          = true
            }
            network_subnet_contributor = {
              role_definition_name = "[ALZ] Network-Subnet-Contributor"
              custom_role          = true
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
              pim_profile_name     = "manager_approval"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
              pim_profile_name     = "manager_approval"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          pre = {
            reader = {
              role_definition_name = "Reader"
              pim_profile_name     = "manager_approval"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
              pim_profile_name     = "manager_approval"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
              pim_profile_name     = "manager_approval"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            security_reader = {
              role_definition_name = "Security Reader"
              pim_profile_name     = "manager_approval"
            }
          }
          prd = {
            reader = {
              role_definition_name = "Reader"
              pim_profile_name     = "manager_approval"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
              pim_profile_name     = "manager_approval"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
              pim_profile_name     = "manager_approval"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            security_reader = {
              role_definition_name = "Security Reader"
              pim_profile_name     = "manager_approval"
            }
          }
        }
      }

      sres = {
        environments = {
          dev = {
            owner = {
              role_definition_name = "Owner"
              pim_profile_name     = "manager_approval"
            }
            application_owner = {
              role_definition_name = "[ALZ] Application-Owners"
              pim_profile_name     = "self_approval"
              custom_role          = true
            }
            reader = {
              role_definition_name = "Reader"
            }
            network_subnet_contributor = {
              role_definition_name = "[ALZ] Network-Subnet-Contributor"
              pim_profile_name     = "self_approval"
              custom_role          = true
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
              pim_profile_name     = "self_approval"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
              pim_profile_name     = "self_approval"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
              pim_profile_name     = "self_approval"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
              pim_profile_name     = "self_approval"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          pre = {
            owner = {
              role_definition_name = "Owner"
              pim_profile_name     = "manager_approval"
            }
            application_owner = {
              role_definition_name = "[ALZ] Application-Owners"
              pim_profile_name     = "self_approval"
              custom_role          = true
            }
            reader = {
              role_definition_name = "Reader"
            }
            network_subnet_contributor = {
              role_definition_name = "[ALZ] Network-Subnet-Contributor"
              pim_profile_name     = "self_approval"
              custom_role          = true
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
              pim_profile_name     = "self_approval"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
              pim_profile_name     = "self_approval"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
              pim_profile_name     = "self_approval"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
              pim_profile_name     = "self_approval"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          prd = {
            owner = {
              role_definition_name = "Owner"
              pim_profile_name     = "manager_approval"
            }
            application_owner = {
              role_definition_name = "[ALZ] Application-Owners"
              pim_profile_name     = "manager_approval"
              custom_role          = true
            }
            reader = {
              role_definition_name = "Reader"
            }
            network_subnet_contributor = {
              role_definition_name = "[ALZ] Network-Subnet-Contributor"
              pim_profile_name     = "manager_approval"
              custom_role          = true
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
              pim_profile_name     = "manager_approval"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
        }
      }

      managers = {
        environments = {
          dev = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_contributor = {
              role_definition_name = "Cost Management Contributor"
            }
            monitoring_reader = {
              role_definition_name = "Monitoring Reader"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          pre = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_contributor = {
              role_definition_name = "Cost Management Contributor"
            }
            monitoring_reader = {
              role_definition_name = "Monitoring Reader"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          prd = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_contributor = {
              role_definition_name = "Cost Management Contributor"
            }
            monitoring_reader = {
              role_definition_name = "Monitoring Reader"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
        }
      }
    }
    basic = {
      engineers = {
        environments = {
          dev = {
            owner = {
              role_definition_name = "Owner"
            }
            application_owner = {
              role_definition_name = "[ALZ] Application-Owners"
              custom_role          = true
            }
            network_subnet_contributor = {
              role_definition_name = "[ALZ] Network-Subnet-Contributor"
              custom_role          = true
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          pre = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          prd = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
        }
      }

      external = {
        environments = {
          dev = {
            application_owner = {
              role_definition_name = "[ALZ] Application-Owners"
              custom_role          = true
            }
            network_subnet_contributor = {
              role_definition_name = "[ALZ] Network-Subnet-Contributor"
              custom_role          = true
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          pre = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          prd = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
        }
      }

      sres = {
        environments = {
          dev = {
            owner = {
              role_definition_name = "Owner"
            }
            application_owner = {
              role_definition_name = "[ALZ] Application-Owners"
              custom_role          = true
            }
            reader = {
              role_definition_name = "Reader"
            }
            network_subnet_contributor = {
              role_definition_name = "[ALZ] Network-Subnet-Contributor"
              custom_role          = true
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          pre = {
            owner = {
              role_definition_name = "Owner"
            }
            application_owner = {
              role_definition_name = "[ALZ] Application-Owners"
              custom_role          = true
            }
            reader = {
              role_definition_name = "Reader"
            }
            network_subnet_contributor = {
              role_definition_name = "[ALZ] Network-Subnet-Contributor"
              custom_role          = true
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          prd = {
            owner = {
              role_definition_name = "Owner"
            }
            application_owner = {
              role_definition_name = "[ALZ] Application-Owners"
              custom_role          = true
            }
            reader = {
              role_definition_name = "Reader"
            }
            network_subnet_contributor = {
              role_definition_name = "[ALZ] Network-Subnet-Contributor"
              custom_role          = true
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_reader = {
              role_definition_name = "Cost Management Reader"
            }
            monitoring_contributor = {
              role_definition_name = "Monitoring Contributor"
            }
            storage_blob_data_contributor = {
              role_definition_name = "Storage Blob Data Contributor"
            }
            storage_file_data_contributor = {
              role_definition_name = "Storage File Data SMB Share Contributor"
            }
            storage_queue_data_contributor = {
              role_definition_name = "Storage Queue Data Contributor"
            }
            storage_table_data_contributor = {
              role_definition_name = "Storage Table Data Contributor"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
        }
      }

      managers = {
        environments = {
          dev = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_contributor = {
              role_definition_name = "Cost Management Contributor"
            }
            monitoring_reader = {
              role_definition_name = "Monitoring Reader"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          pre = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_contributor = {
              role_definition_name = "Cost Management Contributor"
            }
            monitoring_reader = {
              role_definition_name = "Monitoring Reader"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
          prd = {
            reader = {
              role_definition_name = "Reader"
            }
            billing_reader = {
              role_definition_name = "Billing Reader"
            }
            cost_management_contributor = {
              role_definition_name = "Cost Management Contributor"
            }
            monitoring_reader = {
              role_definition_name = "Monitoring Reader"
            }
            security_reader = {
              role_definition_name = "Security Reader"
            }
          }
        }
      }
    }
  }
}
