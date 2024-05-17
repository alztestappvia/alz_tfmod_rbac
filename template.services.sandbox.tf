locals {
  sandbox_templates = {
    standard = {
      sandbox = {
        environments = {
          sandbox = {
            owner = {
              role_definition_name = "Contributor"
            }
          }
        }
      }
    }
  }
}