terraform {
  required_version = "~> 0.11.0"
}

provider "local" {}

resource "docker_image" "application" {
  name = "juliocesarmidia/todo-vue:v1.0.0"
}

resource "docker_container" "application" {
  image    = "${docker_image.application.latest}"
  must_run = true
  name     = "${var.image_app_name}"

  ports {
    internal = "${var.port}"
    external = "${var.port}"
  }
}
