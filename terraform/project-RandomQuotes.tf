data "octopusdeploy_spaces" "defaultSpace" {
  partial_name = "Default"
}

locals {
  spaceId = data.octopusdeploy_spaces.defaultSpace.id
}

resource "octopusdeploy_project" "randomQuotesProject" {
  space_id = local.spaceId

  auto_create_release                  = false
  default_guided_failure_mode          = "EnvironmentDefault"
  default_to_skip_if_already_installed = false
  description                          = "RandomQuotes deployment project"
  discrete_channel_release             = false
  is_disabled                          = false
  is_discrete_channel_release          = false
  is_version_controlled                = false
  lifecycle_id                         = octopusdeploy_lifecycle.defaultDeployLifecycle.id
  name                                 = "Random Quotes IIS"
  project_group_id                     = octopusdeploy_project_group.octopusProjectGroups["Random Quotes"].id
  tenanted_deployment_participation    = "TenantedOrUntenanted"

  connectivity_policy {
    allow_deployments_to_no_targets = false
    exclude_unhealthy_targets       = false
    skip_machine_behavior           = "SkipUnavailableMachines"
  }

  git_persistence_settings {
    url            = "https://github.com/OctopusSamples/RandomQuotes"
    default_branch = "config-as-code-walkthrough"
    base_path = ".octopus/Random Quotes - Config As Code"
    credentials {
      username = var.gitUserName
      password = var.gitAccessToken
    }
  }

}
