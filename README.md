# Local Octopus Container

This project is a testing POC for creating an Octopus instance backed by code wherever possible. Docker for the server, TF for the server configuration, and Configuration as Code for the deployment processes.

## Running From Scratch

* Clone the repository
* Update values in `docker/.env` (`SA_PASSWORD`, `ADMIN_USERNAME`, `ADMIN_PASSWORD`, `DB_CONNECTION_STRING`, `OCTOPUS_SERVER_BASE64_LICENSE`, `MASTER_KEY`)
* Run `docker-compose up` from the `docker` directory
* Define variables for Terraform (see [Sample Terraform variables](#sample-terraform-variables))
* Run `terraform init`, followed by `terraform plan/apply` to create infrastructure in your running container
    
    
## Sample Terraform Variables 

### Environments

Provides the four environments needed for the existing `lifecycles.tf` resources

``` hcl
environments = [
  {
    name        = "Development"
    description = "Dev environment for initial deployments"
    sort_order  = 1
  },
  {
    name        = "Test"
    description = "QA environment for product testing"
    sort_order  = 2
  },
  {
    name        = "Production"
    description = "Live production environment"
    sort_order  = 3
  },
  {
    name        = "Local Server"
    description = "Local servers for runbook targeting"
    sort_order  = 4
  }
]
```

### Project Groups

Provides the project group necessary for the initial project creation

``` hcl
projectGroups = [
  {
    description = "Random Quotes and related deployments"
    name        = "Random Quotes"
  }
]
```