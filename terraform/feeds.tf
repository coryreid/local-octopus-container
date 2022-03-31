resource "octopusdeploy_docker_container_registry" "dockerHubFeed" {
  feed_uri = "https://index.docker.io"
  name = "DockerHub"
}