# Local Octopus Container

This project is a testing POC for creating an Octopus instance backed by code wherever possible. Docker for the server, TF for the server configuration, and Configuration as Code for the deployment processes.

## Running From Scratch

* Clone the repository
* Update values in `docker/.env` (`SA_PASSWORD`, `ADMIN_USERNAME`, `ADMIN_PASSWORD`, `DB_CONNECTION_STRING`, `OCTOPUS_SERVER_BASE64_LICENSE`, `MASTER_KEY`)
* Run `docker-compose up` from the `docker` directory
* Navigate to `http://localhost:8080` and create an API Key for your Octopus administrator
* Define variables for Terraform (specifically `serverUrl`, `apiKey`, `gitUserName`, and `gitAccessKey`)
* Run `terraform init`, followed by `terraform plan/apply` to create infrastructure in your running container