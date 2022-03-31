resource "octopusdeploy_lifecycle" "defaultDeployLifecycle" {
  depends_on = [
    octopusdeploy_environment.octopusEnvironments
  ]

  release_retention_policy {
    quantity_to_keep    = 10
    should_keep_forever = false
    unit                = "Items"
  }

  tentacle_retention_policy {
    quantity_to_keep    = 10
    should_keep_forever = false
    unit                = "Items"
  }

  phase {
    is_optional_phase           = false
    name                        = "Development"
    optional_deployment_targets = [octopusdeploy_environment.octopusEnvironments["Development"].id]
  }

  phase {
    is_optional_phase           = false
    name                        = "Test"
    optional_deployment_targets = [octopusdeploy_environment.octopusEnvironments["Test"].id]
  }

  phase {
    is_optional_phase           = false
    name                        = "Production"
    optional_deployment_targets = [octopusdeploy_environment.octopusEnvironments["Production"].id]
  }

  name = "Deployment Lifecycle"
}

resource "octopusdeploy_lifecycle" "localLifecycle" {
  depends_on = [
    octopusdeploy_environment.octopusEnvironments
  ]

  release_retention_policy {
    quantity_to_keep    = 10
    should_keep_forever = false
    unit                = "Items"
  }

  tentacle_retention_policy {
    quantity_to_keep    = 10
    should_keep_forever = false
    unit                = "Items"
  }

  phase {
    is_optional_phase           = false
    name                        = "Local"
    optional_deployment_targets = [octopusdeploy_environment.octopusEnvironments["Local Server"].id]
  }

  name = "Local Management Lifecycle"
}
