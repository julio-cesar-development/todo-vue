# Defining provider
provider "local" {}

# Outputting variables
output "image" {
  value = "${var.image}"
}

output "image_app_name" {
  value = "${var.image_app_name}"
}

output "image_version" {
  value = "${var.image_version}"
}

output "port" {
  value = "${var.port}"
}

# Start a container
resource "docker_container" "application" {
  image    = "${docker_image.application.latest}"
  must_run = true
  name     = "${var.image_app_name}"              # getting variable image_app_name from env

  ports {
    internal = "${var.port}" # getting variable port from env
    external = "${var.port}" # getting variable port from env
  }
}

# Find the correct image
resource "docker_image" "application" {
  name = "juliocesarmidia/todo-vue:v1.0.0"
}
