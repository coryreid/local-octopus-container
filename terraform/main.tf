terraform {
  backend "s3" {
    bucket = "octopus-samples-terraform-state"
    key    = "coryr-sandbox/localservercontainer"
    region = "us-east-2"
  }

  required_providers {
    octopusdeploy = {
      source  = "OctopusDeployLabs/octopusdeploy"
      version = ">= 0.7.69"
    }
  }
}

provider "octopusdeploy" {
  address  = var.serverUrl
  api_key  = var.apiKey
  space_id = "Spaces-1" # the ID of the space
}
