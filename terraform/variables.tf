variable "serverUrl" {
  type = string
  description = "Server URL of Octopus instance to configure"
}

variable "apiKey" {
  type = string
  description = "API Key with sufficient permissions to perform required Octopus tasks"
}

variable "gitUserName" {
  type = string
  description = "Git username used for authenticating CaC project configuration"
}

variable "gitAccessToken" {
  type = string
  description = "Git Personal Access Token used for authenticating CaC project configuration"
}

variable "environments" {
  type = list(object({
    name        = string
    description = string
    sort_order  = number
  }))
}

variable "projectGroups" {
  type = list(object({
    name        = string
    description = string
  }))
}