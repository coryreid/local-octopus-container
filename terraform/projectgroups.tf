resource "octopusdeploy_project_group" "octopusProjectGroups" {
  for_each    = { for e in var.projectGroups : e.name => e }
  description = each.value.description
  name        = each.value.name
}
