resource "octopusdeploy_environment" "octopusEnvironments" {
  for_each = { for e in var.environments : e.name => e }

  name        = each.value.name
  description = each.value.description
}